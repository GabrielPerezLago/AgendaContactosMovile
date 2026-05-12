import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/services/interfaces/HTTPService.dart';

class MongoService  {
  final _HTTP = HttpService();
  static final String _DB = "mongo";

  Future<List<Contacto>> getContactos() async => await _HTTP.GET(_DB);
  Future<Map<String, List<String>>> createContactos(Contacto c) async => await _HTTP.CREATE(_DB, c);
  Future<Map<String, String>> deleteContacto(String tlf) async => await _HTTP.DELETE(_DB, tlf);
}