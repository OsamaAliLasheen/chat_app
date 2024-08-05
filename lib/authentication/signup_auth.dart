import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpAuth({required String email, required String password}) async {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     
  }
