import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  const AdaptiveFlatButton(this.text, this.handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Platform.isIOS
            ? CupertinoButton(
                onPressed: handler,
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: handler,
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ));
  }
}
