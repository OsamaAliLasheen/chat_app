import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_buttonn.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 75,
            ),
            const Image(
              image: AssetImage('assets/images/scholar.png'),
              height: 100,
            ),
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
                Text('Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
            const SizedBox(height: 10),
            const CustomTextField(labelText: 'Email'),
            const SizedBox(height: 10),
            const CustomTextField(labelText: 'Password'),
            const SizedBox(height: 25),
            const CustomButton(
              text: "Sign In",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login',
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
