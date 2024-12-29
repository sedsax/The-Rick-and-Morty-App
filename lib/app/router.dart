import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricky_and_mortypp/views/app_view.dart';
import 'package:ricky_and_mortypp/views/characters_view/characters_view.dart';
import 'package:ricky_and_mortypp/views/favorites_view/favorites_view.dart';
import 'package:ricky_and_mortypp/views/locations_view/locations_view.dart';
import 'package:ricky_and_mortypp/views/sections_view/sections_view.dart';

// This key is used to control the navigator within the indexed stack and handle navigation between different branches or tabs.
final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._(); 

  static const characters = '/';
  static const favorites = '/favorites';
  static const locations = '/locations';
  static const sections = '/sections';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => const CharactersView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
