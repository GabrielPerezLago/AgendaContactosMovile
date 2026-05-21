import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Image.asset("assets/images/lost_conect.png"),
          TitleApp(text: "Error 404", size: 50, color: Theme.of(context).primaryColorLight,),
          TitleApp(text: "No ha sido posible establecer ", size: 30, color: Theme.of(context).primaryColorLight,),
          TitleApp(text: "Conexión", size: 35, color: Theme.of(context).primaryColorLight,)
        ],
      ),
  );
}