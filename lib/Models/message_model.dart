import 'package:chat_app/constants.dart';

class MessageModel {
  String? message;
  String? id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(json) {
    return MessageModel(json[kMessage], json['id']);
  }
}
