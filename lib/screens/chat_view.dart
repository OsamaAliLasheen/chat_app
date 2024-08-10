import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  static String id = 'ChatView';

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollection);

    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            print(snapshot.data!.docs[1]['messages']);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(kLogo, height: 65),
                    const Text(
                      'Chat',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return Align(
                              alignment: Alignment.centerLeft,
                              child: ChatBubble(
                                message: messageList[index],
                              ));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: messageController,
                      onSubmitted: (value) {
                        messages.add({kMessagesCollection: value});
                        messageController.clear();
                      },
                      decoration: InputDecoration(
                          hintText: "Type a message",
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                messages.add({
                                  kMessagesCollection: messageController.text
                                });
                                messageController.clear();
                              },
                              icon: const Icon(
                                Icons.send,
                                color: kPrimaryColor,
                              ))),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
