import 'package:chat_app/widgets/custom_butotn.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            const Image(image: AssetImage('assets/images/scholar.png')),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  color: Colors.white),
            ),
            Spacer(flex: 2),
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
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xffBADEDC)))),
              ],
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
