import 'package:flutter/material.dart';

class IconAppButton extends StatelessWidget {
  String iconUrl;
  double iconWidth;
  double iconHeight;
  VoidCallback? onClick;
  String? text;
  double? fontSize;
  Size? btnSize = Size(200, 50);

  IconAppButton({
    super.key,
    required this.iconUrl,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.text,
    this.fontSize = 30,
    this.onClick,
    this.btnSize,
  });


  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onClick,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Image.asset(iconUrl,width: this.iconWidth, height: this.iconHeight),
          if (text != null) Text(text!, style: TextStyle(fontSize: fontSize))
        ],
      ),
      style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            minimumSize: btnSize,
      ),
  );
}