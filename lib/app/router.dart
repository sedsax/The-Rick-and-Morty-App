import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricky_and_mortypp/views/app_view.dart';
import 'package:ricky_and_mortypp/views/screens/characters_view/characters_view.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_view.dart';
import 'package:ricky_and_mortypp/views/screens/locations_view/locations_view.dart';
import 'package:ricky_and_mortypp/views/screens/login_view.dart';
import 'package:ricky_and_mortypp/views/screens/sections_view/sections_view.dart';
import 'package:ricky_and_mortypp/views/screens/signup_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const login = '/';
  static const characters = '/characters';
  static const favorites = '/favorites';
  static const locations = '/locations';
  static const sections = '/sections';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.login,
  redirect: (context, state) {
    final user = FirebaseAuth
        .instance.currentUser; // Kullanıcı oturum durumunu kontrol et
    final isLoggedIn = user != null; // Kullanıcı giriş yapmış mı?

    final isLoginRoute =
        state.matchedLocation == AppRoutes.login; // Giriş sayfasında mı?
    final isSignUpRoute =
        state.matchedLocation == '/signup'; // Kayıt sayfasında mı?

    if (!isLoggedIn && !isLoginRoute && !isSignUpRoute) {
      return AppRoutes.login; // Giriş yapmamışsa giriş sayfasına yönlendir
    }

    if (isLoggedIn && (isLoginRoute || isSignUpRoute)) {
      return AppRoutes.characters; // Giriş yapmışsa ana sayfaya yönlendir
    }

    return null; // Yönlendirme yapma
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
