import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/services/interfaces/HTTPService.dart';

class MySqlService {
  static final _HTTP = HttpService();
  static final String _DB = "mysql";
  Future<List<Contacto>> getContactos() => _HTTP.GET(_DB);
}