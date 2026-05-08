import 'package:agenda_contactos/controllers/ContactosController.dart';
import 'package:agenda_contactos/models/Contacto.dart';

class SESSIONDATA {
  static final SESSIONDATA instance = SESSIONDATA._internal();
  ContactosController _CONTROLLER = ContactosController();

  String? _db;
  List<Contacto> _contactos = [];

  SESSIONDATA._internal();

  String? getDB() => _db;
  void setDB(String db) => _db = db;

  Future<List<Contacto>> getContactosHtttp() async {
    _contactos.clear();
    _contactos = await _CONTROLLER.getContactos();
    return this._contactos;
  }

  List<Contacto> getContactosInstance() {
    return this._contactos;
  }


}