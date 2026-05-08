import 'package:agenda_contactos/widgets/buttons/pill.widget.dart';
import 'package:agenda_contactos/widgets/inputs/textfield.widget.dart';
import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateLayout();
}

class _CreateLayout extends State<CreateLayout> {
  static TextEditingController tlfController = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.center,
      padding: EdgeInsetsGeometry.all(30),
      child:SafeArea( child: SingleChildScrollView(
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleApp(
              text: "Añadir Contacto",
              size: 70,),
            Input(
                controller: tlfController,
                inputTittle: "Telefono *",
                placeholder: "Inserte el telefono CON PREFIJO",
                type: TextInputType.phone,
            ),
            Input(
              inputTittle: "Nombre *",
              placeholder: "Inserta el nombre",
            ),
            Input(inputTittle: "Apellidos", placeholder: "Inserte sus apellidos",),
            Input(inputTittle: "Email *", type: TextInputType.emailAddress, placeholder: "Inserte el correo",),
            Input(inputTittle: "Diredccion", placeholder: "Inserte la direccion",),
          Container(
            padding: EdgeInsets.only(
              left: 0.0,
              top: 40,
              right: 0.0,
              bottom: 0.0
            ),
            alignment: Alignment.center,
            child: Pill(text: "Añadir", onClick: () => {}, fontSize: 30,) ,
          )
          ],
        ),
  )));

}