import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompressCard extends StatelessWidget {

  double width;
  double height;
  String text;
  double? iconSize;
  double textSize;
  VoidCallback? onClick;
  final bool hideIcon;

  CompressCard({
    required this.width,
    required this.height,
    required this.text,
    this.iconSize = 65,
    this.textSize = 40,
    this.onClick,
    this.hideIcon = false ,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(child: Container(
    alignment: Alignment.centerLeft,
    width: this.width,
    height: this.height,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusGeometry.circular(60),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 6) )
      ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Row(
          spacing: 30,
          children: [
            Icon(Icons.account_circle, color: Colors.black,size: iconSize),
            TitleApp(text: text, size: textSize, color: Colors.black,)
          ],),
        Row(
          children: [
            if(!hideIcon) IconButton(onPressed: onClick, icon: Icon(Icons.delete, color: Colors.red,))

          ],
        )
      ],
    )
  ),);
}
