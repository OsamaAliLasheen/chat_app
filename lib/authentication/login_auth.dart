import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginAuth(
    {required String email,
    required String password}) async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}
