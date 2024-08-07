import 'package:chat_app/screens/chat_view.dart';
import 'package:chat_app/screens/login_view.dart';
import 'package:chat_app/screens/signUp_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => const LoginView(),
        SignUpView.id: (context) => const SignUpView(),
        ChatView.id: (context) => ChatView(),
      },
      initialRoute: LoginView.id, //default is LoginView
    );
  }
}
