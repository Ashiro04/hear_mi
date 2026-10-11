import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/shell/presentation/pages/main_shell.dart';
import '../../features/tracks/presentation/bloc/tracks_bloc.dart';
import '../../features/tracks/presentation/bloc/tracks_event.dart';
import '../../features/tracks/presentation/pages/home_page.dart';
import '../di/injection.dart';
import 'app_routes.dart';

final _rootKey = GlobalKey<NavigatorState>();

class _Placeholder extends StatelessWidget {
  final String title;
  const _Placeholder(this.title);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text('$title : bientôt')),
  );
}

final appRouter = GoRouter(
  navigatorKey: _rootKey,
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, _, shell) => MainShell(navigationShell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (_, _) => BlocProvider(
                create: (_) => sl<TracksBloc>()..add(const TracksRequested()),
                child: const HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search,
              builder: (_, _) => const _Placeholder('Recherche'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (_, _) => const _Placeholder('Favoris'),
            ),
          ],
        ),
      ],
    ),
  ],
);
