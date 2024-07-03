import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<void> register({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> resetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}