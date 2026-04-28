import 'package:agenda_contactos/widgets/scaffolds/primary_scaffold.widget.dart';
import 'package:flutter/cupertino.dart';

class AgendaScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AgendaScreen();

}

class _AgendaScreen extends State<AgendaScreen> {

  @override
  Widget build(BuildContext context) => PrimaryScaffold(context: context,
      child:  Text("Hola")
  );

}