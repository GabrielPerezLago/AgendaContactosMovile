import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/services/MongoService.dart';
import 'package:agenda_contactos/services/MySqlService.dart';
class ContactosController {
  static final _SESSION = SESSIONDATA.instance;
  final _mongo = MongoService();
  final _mysql = MySqlService();

  Future<List<Contacto>> getContactos() async => _SESSION.getDB() == "mongo" ? await _mongo.getContactos() : await _mysql.getContactos();
}