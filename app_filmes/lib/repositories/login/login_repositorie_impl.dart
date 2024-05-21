import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_repositorie.dart';

class LoginRepositorieImpl implements LoginRepositorie {
  @override
  Future<UserCredential> login() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    throw Exception("Error Ao realizar Login");
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
