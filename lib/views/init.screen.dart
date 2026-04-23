import 'package:agenda_contactos/widgets/app_button.widget.dart';
import 'package:agenda_contactos/widgets/image_composer.widget.dart';
import 'package:agenda_contactos/widgets/title.widget.dart';
import 'package:flutter/material.dart';
class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InitScreen();

}

class _InitScreen extends State<InitScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.jpeg'), fit: BoxFit.cover, opacity: 0.1),
        ),
        child: SafeArea(child:
        SingleChildScrollView(child:
        Column(
          spacing: 150,
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
              child: AppButton(text: "Entrar", onClick: () => {},),
            ),
          ],
        ),
          padding: EdgeInsets.all(40),
        ))
    ));
  }


}