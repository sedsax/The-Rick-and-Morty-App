class AuthService {
  String? _email;

  // Kullanıcı oturum durumunu dinle
  Stream<String?> get authStateChanges => Stream.value(_email);

  // Kullanıcı giriş yapmış mı?
  bool get isLoggedIn => _email != null;

  // Email ve şifre ile giriş yap
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _email = email;
  }

  // Email ve şifre ile kayıt ol
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    _email = email;
  }

  // Çıkış yap
  Future<void> signOut() async {
    _email = null;
  }

  String? get userEmail => _email;
}