import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff274460),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Image(image: AssetImage('assets/images/scholar.png')),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  color: Colors.white),
            ),
            const SizedBox(height: 150),
            const Text('Sign In',
                style: TextStyle(color: Colors.white, fontSize: 28)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24, color: Color(0xff274460)),
                ),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.blue)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
