import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  String text;
  double size;

  TitleApp({
    super.key,
    required this.text,
    this.size = 100
  });

  @override
  Widget build(BuildContext context) => Text(text, style: TextStyle( fontSize: size, wordSpacing: 10,  ), textAlign: TextAlign.center,);
}