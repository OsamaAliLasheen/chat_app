import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Color(0xff274460)),
          ),
        ),
      ),
    );
  }
}
