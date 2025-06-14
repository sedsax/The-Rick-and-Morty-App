import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/views/screens/characters_view/characters_view.dart';
import '../../services/auth_service.dart';
import '../screens/login_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<String?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Yükleniyor durumu
        } else if (snapshot.hasData) {
          return const CharactersView(); 
        } else {
          return const LoginView(); // Kullanıcı giriş yapmamışsa giriş sayfasına yönlendir
        }
      },
    );
  }
}