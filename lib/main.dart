import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/app/router.dart';
import 'package:ricky_and_mortypp/app/theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
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
