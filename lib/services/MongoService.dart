import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/services/interfaces/HTTPService.dart';

class MongoService  {
  final _HTTP = HttpService();
  static final String DB = "mongo";

  Future<List<Contacto>> getContactos() async => await _HTTP.GET(DB);
}