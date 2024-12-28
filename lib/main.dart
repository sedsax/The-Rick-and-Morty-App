import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/theme.dart';
import 'package:ricky_and_mortypp/views/app_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: 'Material App',
        home: const AppView());
  }
}
