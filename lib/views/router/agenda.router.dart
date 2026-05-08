import 'package:agenda_contactos/views/agenda.screen.dart';
import 'package:agenda_contactos/views/init.screen.dart';
import 'package:agenda_contactos/views/layouts/create_contacto.layout.dart';
import 'package:agenda_contactos/views/layouts/list.layout.dart';
import 'package:agenda_contactos/views/layouts/search.layout.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/init',
  routes: [
    GoRoute(
        path: '/init',
        builder: (context, state) => InitScreen()
    ),
    ShellRoute(
    builder: (context, state, child) {
      return AgendaScreen(view: child);
    },
    routes: [
      GoRoute(
        path: '/list',
        builder: (context, state) => ListLayout()
      ),
      GoRoute(
          path: '/create',
          builder: (context, state) => CreateLayout()
      ),
      GoRoute(
        path: '/search',
        builder: (context,state ) => SearchLayout()
      )
    ]
    ),
]
);