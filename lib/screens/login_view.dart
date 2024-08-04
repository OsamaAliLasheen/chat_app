import 'package:chat_app/authentication/login_auth.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/sign_in_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(height: 75),
            const Image(
                image: AssetImage('assets/images/scholar.png'), height: 100),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'pacifico',
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
            const SizedBox(height: 10),
            const CustomTextField(labelText: 'Email'),
            const SizedBox(height: 10),
            const CustomTextField(labelText: 'Password'),
            const SizedBox(height: 25),
            CustomButton(
              text: "LOGIN",
              onTap: () async {
                await loginAuth(
                  emailController: emailController.text,
                  passwordController: passwordController.text,
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    child: const Text('Sign Up',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xffBADEDC)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
