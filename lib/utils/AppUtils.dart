import 'package:agenda_contactos/controllers/ContactosController.dart';
import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/widgets/cards/compress_card.widget.dart';
import 'package:flutter/cupertino.dart';

class AppUtils {
  static final ContactosController _controller = ContactosController();
  
  List<Widget> compressCardComposer(List<Contacto> contactos) {
      List<Widget> cards = [];

      if (contactos.isEmpty){
        throw Exception("compressCardComposer() contactos esta vaccio");
      }

      contactos.asMap().entries.map((contacto) {
        cards.add(
            CompressCard(
                width: 420,
                height: 100,
                text: contacto.value.nombre.toUpperCase(),
                onClick: () {
                  _controller.deleteContacto(contacto.value.telefono);
                },
            )
        );
      }).toList();

      return cards;
  }


  CompressCard singleComopressCardContacto(Contacto contacto, VoidCallback onClick) => CompressCard(width: 420, height: 100, text: contacto.nombre, onClick: onClick);
  CompressCard singleCompressCardString(String nombre, VoidCallback onClick) => CompressCard(width: 420, height: 100, text: nombre, onClick: onClick,);
}