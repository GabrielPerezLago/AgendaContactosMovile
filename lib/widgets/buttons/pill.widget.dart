import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  String text;
  final VoidCallback? onClick;
  double? fontSize = 20;
  Size? btnSize = Size(200, 50);

  Pill({
    super.key,
    required this.text,
    this.onClick,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        minimumSize: btnSize,
      ),
      child: Text(text , style: TextStyle(fontSize: fontSize),)
  );
}