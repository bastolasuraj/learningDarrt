import 'dart:io';

import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class AdaptiveFlatButtons extends StatelessWidget {
  final String text;
  final Function onPressedHandler;

  AdaptiveFlatButtons(this.text, this.onPressedHandler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressedHandler,
          )
        : FlatButton(
            onPressed: onPressedHandler,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
