import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/app/router.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/services/auth_service.dart';
import 'package:ricky_and_mortypp/views/screens/characters_view/characters_viewmodel.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_viewmodel.dart';
import 'package:ricky_and_mortypp/app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => locator<AuthService>()), 
        ChangeNotifierProvider(
          create: (context) => CharactersViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesViewmodel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
