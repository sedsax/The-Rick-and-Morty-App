import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/services/auth_service.dart';
import 'package:ricky_and_mortypp/views/app_view.dart';
import 'package:ricky_and_mortypp/views/screens/characters_view/characters_view.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_view.dart';
import 'package:ricky_and_mortypp/views/screens/locations_view/locations_view.dart';
import 'package:ricky_and_mortypp/views/screens/login_view.dart';
import 'package:ricky_and_mortypp/views/screens/sections_view/sections_view.dart';
import 'package:ricky_and_mortypp/views/screens/signup_view.dart';
import 'package:ricky_and_mortypp/views/screens/settings_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const login = '/';
  static const characters = '/characters';
  static const favorites = '/favorites';
  static const locations = '/locations';
  static const sections = '/sections';
  static const settings = '/settings';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.login,
  redirect: (context, state) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final isLoggedIn = authService.isLoggedIn;

    final isLoginRoute = state.matchedLocation == AppRoutes.login;
    final isSignUpRoute = state.matchedLocation == '/signup';

    if (!isLoggedIn && !isLoginRoute && !isSignUpRoute) {
      return AppRoutes.login;
    }

    if (isLoggedIn && (isLoginRoute || isSignUpRoute)) {
      return AppRoutes.characters;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsView(),
    ),
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
