import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const AdaptativeButton(
      {required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            child: Text(label),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
