import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  final VoidCallback? onClick;

  AppButton({
    super.key,
    required this.text,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          minimumSize: Size(200, 50)
      ),
      child: Text(text,
        style: TextStyle(fontSize: 30.0),
      )
  );
}