
import 'package:chat_app/constants.dart';

class MessageModel {
  String? message;

  MessageModel(this.message);

  factory MessageModel.fromJson(json) {
    return MessageModel(json[kMessage]);
  } 
}