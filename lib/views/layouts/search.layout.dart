import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/utils/AppUtils.dart';
import 'package:agenda_contactos/widgets/cards/compress_card.widget.dart';
import 'package:agenda_contactos/widgets/inputs/textfield.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SearchLayout extends StatefulWidget {
  @override
  State<SearchLayout> createState() => _SearchLayout();
}

class _SearchLayout extends State<SearchLayout> {
  final _utils = AppUtils();
  TextEditingController serchController = TextEditingController();
  List<Contacto> _contactos = [];
  List<Widget> _cards = [];

  @override
  void initState() {
    _loadData();
  }

  void _loadData() {
    try {
      _contactos = SESSIONDATA.instance.getContactosInstance();
      setState(() {
        _cards = _utils.compressCardComposer(_contactos);
      });
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      padding: EdgeInsets.symmetric(vertical: 100),
      alignment: Alignment.center,
      child: Column(
        children: [
          Input(
            controller: serchController,
            placeholder: "Buscar..",
            type: TextInputType.webSearch,
            inputTittle: "Buscar",
            onChange: _search,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric( vertical: 30),
                    alignment: Alignment.center,
                    child: Column(
                      spacing: 20,
                      children: _cards,
                    ),
                  )
              )
          )
        ],
      ),
    ));
  }

  void _search(String data) {
    final filter = _contactos.where((contacto) {
      return contacto.nombre.toLowerCase().contains(data.toLowerCase());
    }).toList();

    setState(() {
      _cards = _utils.compressCardComposer(filter);
    });
  }
}
