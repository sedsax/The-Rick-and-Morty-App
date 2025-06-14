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
      child: ThemeSwitcher(),
    ),
  );
}

class ThemeSwitcher extends StatefulWidget {
  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  ThemeMode _themeMode = ThemeMode.light;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyApp(
      themeMode: _themeMode,
      changeTheme: _changeTheme,
    );
  }
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode)? changeTheme;
  const MyApp({super.key, this.themeMode = ThemeMode.light, this.changeTheme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      builder: (context, child) {
        return MyTheme(
          changeTheme: changeTheme ?? (_) {},
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

class MyTheme extends InheritedWidget {
  final void Function(ThemeMode) changeTheme;
  const MyTheme({required this.changeTheme, required super.child, super.key});

  static MyTheme? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyTheme>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
