import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/services/MongoService.dart';

class MongoController {
  final service = MongoService();

  Future<List<Contacto>> getContactos() async => await service.getContactos();


}