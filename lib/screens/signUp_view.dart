import 'package:chat_app/screens/chat_view.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:chat_app/authentication/signup_auth.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Image(
                  image: AssetImage(kLogo),
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
                CustomTextField(
                  labelText: 'Email',
                  onchanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Password',
                  onchanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await signUpAuth(email: email!, password: password!);
                        Navigator.pushNamed(context, ChatView.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, 'Something went wrong');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  text: "Sign Up",
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
                            style: TextStyle(
                                fontSize: 18, color: Color(0xffBADEDC)))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
