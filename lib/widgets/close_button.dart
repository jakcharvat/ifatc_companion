import 'package:flutter/material.dart';

import '../models/extensions.dart' show HoverEffects;
import '../models/enums.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        borderRadius: BorderRadius.circular(4.0),
        child: IconButton(
          icon: Icon(Icons.close, color: Theme.of(context).backgroundColor),
          onPressed: () => Navigator.of(context).pop(),
          highlightColor: Theme.of(context).backgroundColor.withOpacity(0.1),
          splashColor: Theme.of(context).backgroundColor.withOpacity(0.3),
        ),
      ).cursor(CursorType.pointer),
    );
  }
}