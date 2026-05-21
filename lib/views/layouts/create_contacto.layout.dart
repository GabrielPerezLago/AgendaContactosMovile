import 'package:agenda_contactos/controllers/ContactosController.dart';
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
  final ContactosController _controller = ContactosController();
  final TextEditingController _tlfController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();

   String _errorMessage = "";
   String _successMessage = "";

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
              size: 70,
              color: Theme.of(context).primaryColorLight,
            ),
            Input(
                controller: _tlfController,
                inputTittle: "Telefono *",
                placeholder: "Inserte el telefono CON PREFIJO",
                type: TextInputType.phone,
            ),
            Input(
              controller: _nameController,
              inputTittle: "Nombre *",
              placeholder: "Inserta el nombre",
            ),
            Input(controller: _apellidosController ,inputTittle: "Apellidos", placeholder: "Inserte sus apellidos",),
            Input(controller: _emailController ,inputTittle: "Email *", type: TextInputType.emailAddress, placeholder: "Inserte el correo",),
            Input(controller: _direccionController ,inputTittle: "Diredccion", placeholder: "Inserte la direccion",),

            // mensaje de error o sucees
            _successMessage.isNotEmpty ? Text(_successMessage, style: TextStyle(fontSize: 20, color: Colors.green),) : Text(_errorMessage, style: TextStyle(fontSize: 20, color: Colors.red),),

          Container(
            padding: EdgeInsets.only(
              left: 0.0,
              top: 40,
              right: 0.0,
              bottom: 0.0
            ),
            alignment: Alignment.center,
            child: Pill(text: "Añadir", onClick: () {
              final data = {
               "nombre": _nameController.text,
               "apellidos": _apellidosController.text,
               "email": _emailController.text,
               "telefono": _tlfController.text,
               "direccion": _direccionController.text
              };

              _validateData(data);
            }, fontSize: 30,) ,
          ),

          ],
        ),
  )));

  void _validateData(Map<String, String> formData) async {
      List<String> errStrign = [];

      if (formData.containsKey("nombre")) {
        if (formData['nombre'] == "") errStrign.add("El campo nombre no puede estar vacio");
      } else {
        errStrign.add("Tiene que haber un campo nombre");
      }

      if (formData.containsKey("email")) {
        if (formData['email'] == "") errStrign.add("El campo email no puede estar vacío");
      } else {
        errStrign.add("Deber haber un campo email");
      }

      if (formData.containsKey("telefono")) {
        if (formData['telefono'] == "" ) errStrign.add("El campo telefono no puede estar vacío");
      } else {
        errStrign.add("Deber haber un campo telefono");
      }

      if (errStrign.isNotEmpty) {
        _messageStrCompose(errStrign.join(" , ").replaceAll("[", "").replaceAll("]", ""), 'error');
      } else {
        final Map<String, String> res = await _controller.createContacto(formData);
        if (res.keys.contains('success')) {
          _messageStrCompose(res['success'].toString().replaceAll("[", "").replaceAll("]", ""), 'success');
        } else if (res.keys.contains('error')) {
          _messageStrCompose(res['error'].toString().replaceAll("[", "").replaceAll("]", ""), 'error');
        }
      }

  }

  void _messageStrCompose(String str, String type) => setState(() {
    if (type != "success" && type != "error") throw Exception("Parametro 'type' no valido : Parametros esperados => 'success' or 'error' ");

    _errorMessage = "";
    _successMessage = "";

    type == 'success' ? _successMessage  += str : _errorMessage += str + " .";
  });

}