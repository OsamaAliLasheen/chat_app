import 'package:chat_app/widgets/custom_butotn.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff274460),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Image(image: AssetImage('assets/images/scholar.png')),
            Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  color: Colors.white),
            ),
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
            SizedBox(height: 10),
            CustomTextField(labelText: 'First Name'),
            SizedBox(height: 10),
            CustomTextField(labelText: 'Last Name'),
            SizedBox(height: 10),
            CustomTextField(labelText: 'Email'),
            SizedBox(height: 10),
            CustomTextField(labelText: 'Password'),
            SizedBox(height: 25),
            CustomButton(
              text: "Sign In",
            ),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
