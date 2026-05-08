import 'package:agenda_contactos/controllers/ContactosController.dart';
import 'package:agenda_contactos/models/Contacto.dart';
import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/utils/AppUtils.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:agenda_contactos/widgets/cards/compress_card.widget.dart';
import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLayout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ListLayout();

}

class _ListLayout extends State<ListLayout> {
  static final _utils = AppUtils();
  bool isLoading = true;
  List<Contacto> _contactos = List.empty();
  List<Widget> _cards =  [];


  @override
  void initState() {
    super.initState();
    _loadData();
  }


  void _loadData() async {
    try {
      _contactos =  await SESSIONDATA.instance.getContactosHtttp();
      setState(() {
        isLoading = false;
        _cards = _utils.compressCardComposer(_contactos);
      });

    } catch (ex) {
      print(ex);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Center(
        child:  CircularProgressIndicator(),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: SafeArea(child: SingleChildScrollView(
          child: SizedBox(
            height: 600,
            child: Swiper(
              layout: SwiperLayout.STACK,
                itemCount: _cards.length,
                duration: 4,
                scrollDirection: Axis.vertical,
                itemHeight: 100,
                itemWidth: 450,
                itemBuilder: (context, index) {
                  final _card = _cards[index];
                  return Container(
                    height: 300,
                    child: _card,
                  );
                }),
          )
        ),
        )
    );
  }

}

