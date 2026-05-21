import 'package:agenda_contactos/controllers/ContactosController.dart';
import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/widgets/cards/compress_card.widget.dart';
import 'package:agenda_contactos/widgets/cards/expand_card.widget.dart';
import 'package:agenda_contactos/widgets/inputs/textfield.widget.dart';
import 'package:agenda_contactos/widgets/mini_views/contactos_empty.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SearchLayout extends StatefulWidget {
  @override
  State<SearchLayout> createState() => _SearchLayout();
}

class _SearchLayout extends State<SearchLayout> {
  bool isLoading = true;
  final _controller = ContactosController();
  TextEditingController serchController = TextEditingController();
  List<Contacto> _contactos = [];

  int? _expandedIndex;


  @override
  void initState() {
    _loadData();
  }

  void _loadData() async {
    try {
      final data = await SESSIONDATA.instance.getContactosHtttp();
      setState(() {
        _contactos = data;
        isLoading = false;
      });
    } catch (ex) {
      context.go("/error");
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {

    if(isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return SafeArea(child: _contactos.isNotEmpty ?
    Container(
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
                    padding: EdgeInsets.symmetric( vertical: 20),
                    alignment: Alignment.center,
                    child: Column(
                      spacing: 20,
                      children: _contactos.asMap().entries.map((entry) {
                        final index = entry.key;
                        final contacto = entry.value;

                        final isExpand = _expandedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_expandedIndex == index) {
                                _expandedIndex = null;
                              } else {
                                _expandedIndex = index;
                              }
                            });},
                          child: isExpand ? ExpandCard(context: context, contacto: contacto, onClick: _deleteContacto(contacto),) : CompressCard(width: 420, height: 80, text: contacto.nombre.toUpperCase(), onClick: _deleteContacto(contacto),)
                        );

                      }).toList(),
                    ),
              ),
          )),
        ],
      ),
    ) : //else
      EmptyData()
    );
  }

  void _search(String data) {
    final filter = _contactos.where((contacto) {
      return contacto.nombre.toLowerCase().contains(data.toLowerCase());
    }).toList();
    if (filter.isEmpty) _loadData();
    setState(() {
      _contactos = filter;
    });
  }

  VoidCallback _deleteContacto(Contacto contacto) {
    return () async{
      final response = await _controller.deleteContacto(contacto.telefono.replaceAll(" ", ""));

      if (response == 204) setState(() {
        _contactos.remove(contacto);
      });
    };
  }
}
