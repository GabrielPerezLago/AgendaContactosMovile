import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/services/MongoService.dart';
import 'package:agenda_contactos/services/MySqlService.dart';
class ContactosController {
  static final _SESSION = SESSIONDATA.instance;
  final _mongo = MongoService();
  final _mysql = MySqlService();

  Future<List<Contacto>> getContactos() async => _SESSION.getDB() == "mongo" ? await _mongo.getContactos() : await _mysql.getContactos();

  Future<Map<String, String>> createContacto(Map<String, String> params) async {
      params.forEach(( key, value ) => value.toString().toLowerCase().trim());

      final contacto = Contacto(
        id: null,
        nombre: params["nombre"] ?? "",
        apellidos: params["apellidos"] ?? null,
        email: params["email"] ?? "",
        telefono: params["telefono"] ?? "",
        direccion: params["direccion"] != "" ?  params["direccion"] : null
      );
      
       final Map<String, List<String>> response =  await ( _SESSION.getDB() == "mongo" ? _mongo.createContactos(contacto) : _mysql.createContactos(contacto));


        Map<String, String> mapper = {};

        response.forEach((key, value) {
          String data = "";
          value.forEach((v) => data += value.toString());
          mapper.addAll({key.toString(): data});
        });

        return mapper;
  }


  Future<Map<String, String>> deleteContacto(String tlf) async {
      final Map<String, String> res = await ( SESSIONDATA.instance.getDB() == 'mongo' ? _mongo.deleteContacto(tlf) : _mysql.deleteContacto(tlf));
      return res;
  }

}