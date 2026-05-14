import 'package:agenda_contactos/models/Contacto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandCard extends StatelessWidget {
  final BuildContext context;

  static final _black = Colors.black;
  final Contacto contacto;
  final VoidCallback onClick;

  late final double screenWidth = MediaQuery.of(context).size.width;

  ExpandCard({ required this.context,  required this.contacto ,required this.onClick});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 6) )
        ]
    ),
    padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10
    ),
    width: screenWidth * 0.9 ,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Icon(Icons.account_circle, size: 90, color: Colors.black,),
        Text(contacto.nombre.toUpperCase(), style: TextStyle(color: _black),),
        if (contacto.apellidos != null && contacto.apellidos != "") Text(contacto.apellidos!.toUpperCase(), style: TextStyle(color: _black),),
        Text(contacto.email.toUpperCase(), style: TextStyle(color: _black),),
        Text(contacto.telefono, style: TextStyle(color: _black),),
        if (!_isDirectionEmpty(contacto.direccion!)) Text(contacto.direccion!.toLowerCase(), style: TextStyle(color: _black),),
        IconButton(onPressed: onClick, icon: Icon(Icons.delete, color: Colors.red,))
      ],
    ),
  );
}

bool _isDirectionEmpty(String? direccion) {
  if (direccion == null) return true;
  String filtered = direccion.replaceAll(",", "").replaceAll(" ", "").trim();
  if (filtered == "") {
    return true;
  }
   return false;
}
