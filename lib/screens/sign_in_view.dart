import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff274460),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image(image: AssetImage('assets/images/scholar.png')),
            Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
