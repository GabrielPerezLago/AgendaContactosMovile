import 'package:agenda_contactos/services/instances/DBInstance.dart';
import 'package:agenda_contactos/utils/ScreenUtils.dart';
import 'package:agenda_contactos/views/agenda.screen.dart';
import 'package:agenda_contactos/widgets/buttons/pill_icon.widget.dart';
import 'package:agenda_contactos/widgets/scaffolds/base_scaffold.widget.dart';
import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDBScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectDBScreen();
}

class _SelectDBScreen extends State<SelectDBScreen> {
  static final UTILS = ScreenUtils();
  
  @override
  Widget build(BuildContext context) =>
      BaseScaffold(
        context: context,
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 300,
            children: [
              TitleApp(text: "¿Que base de datos Prefiere?", size: 70,),
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
                        UTILS.RouterReplace(context, AgendaScreen())
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
                        UTILS.RouterReplace(context, AgendaScreen())
                      },
                      fontSize: 30,)
                  ],
                ),
              )
            ],
          )
      );
}