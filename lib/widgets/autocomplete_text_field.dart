import 'dart:async';

import 'package:atc_companion/widgets/loading_screen.dart';
import 'package:atc_companion/widgets/main_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/airport.dart';

class AutocompleteTextField extends StatefulWidget {
  @override
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  Timer _timer;
  OverlayEntry _overlayEntry;
  String _oldValue;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 200), () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        });
      }
    });

    _controller.addListener(() {
      String text = _controller.text.toUpperCase();

      if (_oldValue == text) return;
      _oldValue = text;

      final icaos = Provider.of<AirportState>(context, listen: false).icaos;

      _overlayEntry?.remove();
      _overlayEntry = null;
      if (icaos != null && text.length > 1 && _focusNode.hasFocus) {
        final suggestions = icaos.where((element) => element.startsWith(text)).toList();
        _showSuggestions(suggestions);
      }
    });
  }

  void _showSuggestions(List<String> suggestions) {
    final RenderBox box = context.findRenderObject();
    final Size size = box.size;
    final Offset offset = box.localToGlobal(Offset.zero);

    final screenHeight = MediaQuery.of(context).size.height;
    final topSpace = offset.dy;
    final bottomSpace = screenHeight - (offset.dy + size.height);

    final top = topSpace > bottomSpace ? null : offset.dy + size.height;
    final bottom = topSpace > bottomSpace ? (screenHeight - offset.dy + 10) : null;
    final maxHeight = topSpace > bottomSpace ? (offset.dy - 20) : (screenHeight - (offset.dy + size.height + 10));
    final left = offset.dx;
    final width = size.width;


    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: top,
        bottom: bottom,
        left: left,
        width: width,
        child: Material(
          elevation: 8.0,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(suggestions[index]),
                onTap: () => _openAirport(suggestions[index]),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        labelText: 'ICAO',
        isDense: true,
        filled: true,
        fillColor: Theme.of(context).accentColor.withOpacity(0.1),
        labelStyle: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      controller: _controller,
      maxLength: 4,
      cursorColor: Theme.of(context).accentColor,
      focusNode: _focusNode,
      onSubmitted: (value) {
        final text = value.toUpperCase();
        if (text.length != 4) return;

        _openAirport(text);
      },
    );
  }

  void _openAirport(String icao) {
    final navigator = Navigator.of(context);

    _overlayEntry?.remove();
    _overlayEntry = null;

    _oldValue = null;
    _controller.text = '';

    navigator.push(MaterialPageRoute(builder: (context) => LoadingScreen()));
    Provider.of<AirportState>(context, listen: false).getAirport(icao, callback: () {
      navigator.pushReplacement(MaterialPageRoute(builder: (context) => MainDisplay()));
    }, onError: Navigator.of(context).pop);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
