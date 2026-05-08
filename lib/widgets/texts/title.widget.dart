import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  String text;
  double size;
  Color? color;

  TitleApp({
    super.key,
    required this.text,
    this.size = 100,
    this.color
  });

  @override
  Widget build(BuildContext context) => Text(text, style: TextStyle( fontSize: size, wordSpacing: 10, color: color ?? Theme.of(context).primaryColorDark  ), textAlign: TextAlign.center,);
}