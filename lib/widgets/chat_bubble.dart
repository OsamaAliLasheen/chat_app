import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.message,
  });
  final MessageModel? message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, top: 10.0, bottom: 10.0, right: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          )),
      child: Text(
        message!.message!,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
