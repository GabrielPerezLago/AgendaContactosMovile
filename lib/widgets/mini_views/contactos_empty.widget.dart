import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleApp(text: "Vaya aún no tines contactos :[", size: 50, color: Theme.of(context).primaryColorLight,),
          Image.asset("assets/images/stickman.png", width: 200,)
        ],
      )
  );
}