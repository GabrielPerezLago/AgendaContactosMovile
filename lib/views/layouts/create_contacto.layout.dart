import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';

class CreateLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateLayout();
}

class _CreateLayout extends State<CreateLayout> {

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: TitleApp(text: "Añadir"),
  );

}