import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginAuth(
    {required String emailController, required String passwordController}) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController,
      password: passwordController,
    );

    print(credential.user!.email);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
