
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PillIcon extends StatelessWidget {
  VoidCallback? onClick;
  String? text;
  String iconUrl;
  double fontSize;

  double iconWidth;
  double iconHeight;
  Size? btnSize = Size(200, 50);

  PillIcon({
    required this.iconUrl,
    this.text,
    this.onClick,
    this.fontSize = 20,
    this.iconHeight = 40,
    this.iconWidth = 40,
    this.btnSize
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Image.asset(iconUrl,width: this.iconWidth, height: this.iconHeight),
          if (text != null) Text(text!, style: TextStyle(fontSize: fontSize))
        ],
      ),
  );
}