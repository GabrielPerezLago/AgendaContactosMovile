import 'package:agenda_contactos/widgets/texts/title.widget.dart';
import 'package:flutter/cupertino.dart';

class ListLayout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ListLayout();

}

class _ListLayout extends State<ListLayout> {
  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.center,
      child: TitleApp(text: "Lista")
  );
}