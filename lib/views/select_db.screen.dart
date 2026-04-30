import 'package:agenda_contactos/services/instances/SESSION.dart';
import 'package:agenda_contactos/utils/ScreenUtils.dart';
import 'package:agenda_contactos/widgets/buttons/pill_icon.widget.dart';
import 'package:agenda_contactos/widgets/scaffolds/base_scaffold.widget.dart';
import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectDBScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectDBScreen();
}

class _SelectDBScreen extends State<SelectDBScreen> {
  static final UTILS = ScreenUtils();
  
  @override
  Widget build(BuildContext context) =>
      BaseScaffold(
        opacity: 0.1,
        context: context,
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 300,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  spacing: 20,
                  children: [
                    TitleApp(text: "Selecciona", size: 100,),
                    TitleApp(text: "Base de datos", size: 80,),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  spacing: 30,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PillIcon(iconUrl: 'assets/images/mongo.png',
                      iconHeight: 40,
                      iconWidth: 40,
                      text: "Mongo",
                      onClick: () => {
                        SESSION.instance.setDB("mongo"),
                        context.go('/list')
                      },
                      btnSize: Size(180, 80),
                      fontSize: 30,),
                    PillIcon(iconUrl: 'assets/images/mysql.png',
                      iconHeight: 40,
                      iconWidth: 40,
                      text: "Mysql",
                      btnSize: Size(180, 80),
                      onClick: () => {
                        SESSION.instance.setDB("mysql"),
                        context.go('/list')
                      },
                      fontSize: 30,)
                  ],
                ),
              )
            ],
          )
      );
}