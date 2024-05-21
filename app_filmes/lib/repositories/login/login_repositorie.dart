import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositorie {
  Future<UserCredential> login();
  Future<void> logout();
}
