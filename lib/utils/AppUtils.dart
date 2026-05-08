import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/widgets/cards/compress_card.widget.dart';
import 'package:flutter/cupertino.dart';

class AppUtils {
  List<Widget> compressCardComposer(List<Contacto> contactos) {
      List<Widget> cards = [];

      if (contactos.isEmpty){
        throw Exception("compressCardComposer() contactos esta vaccio");
      }

      contactos.asMap().entries.map((contacto) {
        cards.add(CompressCard(width: 420, height: 100, text: contacto.value.nombre.toUpperCase()));
      }).toList();

      return cards;
  }


  CompressCard singleComopressCardContacto(Contacto contacto) => CompressCard(width: 420, height: 100, text: contacto.nombre);
  CompressCard singleCompressCardString(String nombre) => CompressCard(width: 420, height: 100, text: nombre);
}