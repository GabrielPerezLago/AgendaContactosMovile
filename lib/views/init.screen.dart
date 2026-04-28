import 'package:agenda_contactos/utils/ScreenUtils.dart';
import 'package:agenda_contactos/views/select_db.screen.dart';
import 'package:agenda_contactos/widgets/buttons/pill.widget.dart';
import 'package:agenda_contactos/widgets/images_composers/image_composer.widget.dart';
import 'package:agenda_contactos/widgets/scaffolds/base_scaffold.widget.dart';
import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/material.dart';


class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InitScreen();

}

class _InitScreen extends State<InitScreen>{
  static final ScreenUtils UTILS = ScreenUtils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(context: context,
        child: Container(
          alignment: Alignment.center,
          child: SafeArea(child:
          SingleChildScrollView(child:
          Column(
            spacing: 120,
            children: [
              Container(
                alignment: Alignment.center,
                child: ImageComposer(src: 'assets/images/logo.png', size: 200,),
              ),
              Container(
                  alignment: Alignment.center,
                  child: TitleApp(text: "Agenda de Contactos", size: 90,)
              ),
              Container(
                alignment: Alignment.center,
                child: Pill(
                  text: "Entrar",
                  onClick: () => UTILS.Router(context, SelectDBScreen()),
                  fontSize: 30,

                ),
              ),
            ],
          ),
          )),
        )
    );
  }


}