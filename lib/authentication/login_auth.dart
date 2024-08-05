import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginAuth(
    {required String emailController,
    required String passwordController}) async {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController,
    password: passwordController,
  );
}
