import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcı oturum durumunu dinle
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Kullanıcı giriş yapmış mı?
  User? get currentUser => _auth.currentUser;

  // Email ve şifre ile giriş yap
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Email ve şifre ile kayıt ol
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Çıkış yap
  Future<void> signOut() async {
    await _auth.signOut();
  }
}