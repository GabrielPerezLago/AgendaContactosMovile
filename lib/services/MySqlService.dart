import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/services/interfaces/HTTPService.dart';

class MySqlService {
  static final _HTTP = HttpService();
  static final String _DB = "mysql";

  /**
   * @params { void } ::
   * Funcion que Captura todos los contactos de la api
   */
  Future<List<Contacto>> getContactos() => _HTTP.GET(_DB);
  /**
   * @params { Contacto } ::
   * Metodo que recive un object Contacto , y manda una peticion de creacion a la api.
   *
   * @return { List -> String }
   */
  Future<Map<String, List<String>>> createContactos(Contacto c) async => await _HTTP.CREATE(_DB, c);
  Future<Map<String, String>> deleteContacto(String tlf) async => await _HTTP.DELETE(_DB, tlf);
}