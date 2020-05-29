import 'package:flutter/material.dart';


import '../consts.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 4,
        decoration: BoxDecoration(
          color: splitterColor,
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}
