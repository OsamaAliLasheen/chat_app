import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.labelText, this.onchanged});

  final String labelText;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }
}
