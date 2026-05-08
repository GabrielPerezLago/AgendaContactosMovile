import 'package:agenda_contactos/controllers/ContactosController.dart';
import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';

void main() async {
  try {
    ContactosController controller = ContactosController();
   SESSIONDATA.instance.setDB("mysql");
   List<Contacto> contactos = await controller.getContactos();
    contactos.forEach((contacto) => {
      print(contacto.toString())
    });
  } catch(ex) {
    print(ex);
  }
}