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
        LoginView.id: (context) => LoginView(),
        SignUpView.id: (context) => SignUpView(),
      },
      initialRoute: 'LoginView', //default is LoginView
    );
  }
}