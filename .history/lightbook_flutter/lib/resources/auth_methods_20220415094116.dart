import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty){
        // register user
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
