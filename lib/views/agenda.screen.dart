import 'package:agenda_contactos/models/SESSION.dart';
import 'package:agenda_contactos/utils/ScreenUtils.dart';
import 'package:agenda_contactos/widgets/images_composers/image_composer.widget.dart';
import 'package:agenda_contactos/widgets/scaffolds/drawn_scene.widget.dart';
import 'package:agenda_contactos/widgets/styles/decoration_bg.wifget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgendaScreen extends StatefulWidget {
  Widget? view;

  AgendaScreen({
    this.view
  });

  @override
  State<StatefulWidget> createState() => _AgendaScreen();
}

class _AgendaScreen extends State<AgendaScreen> {
  int page = 0;
  final routes = ['/search', '/create', '/list', '/error'];

  void onRouter(int i) {
    setState(() => page = i);
    context.go(routes[i]);
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationBackground().decoration(context),
          ),
        ),
      ),

      Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(onPressed: () => context.go('/init'), icon: Icon(Icons.arrow_back)),
          title: ScreenUtils().LogoInit(context, 50, 50),
          actions: [
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ImageComposer(
                  src: SESSIONDATA.instance.getDB() == "mongo"
                      ? "assets/images/mongo.png"
                      : "assets/images/mysql.png",
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: DrawnPainter(child: widget.view ?? SizedBox.shrink())
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: page,
          /**
           * Esto es para que el fondo se vea
           */
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: onRouter,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: CupertinoIconThemeData(size: 30),
          selectedFontSize: 20,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: page == 0 ? "Buscar" : ""),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle),  label: page == 1 ? "Añadir" : ""),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: page == 2 ? 'Contactos' : "")
          ],
        ),
      ),
    ],
  );
}
