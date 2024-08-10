import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  static String id = 'ChatView';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollection);

    final Stream<QuerySnapshot> messageStream = FirebaseFirestore.instance
        .collection(kMessagesCollection)
        .orderBy(kTimestamp, descending: false)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: messageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }

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
                        controller: scrollController,
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
                        messages.add({
                          kMessagesCollection: value,
                          kTimestamp: FieldValue
                              .serverTimestamp() // Add timestamp when submitting
                        });
                        messageController.clear();
                        scrollToBottom();
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
                                  kMessagesCollection: messageController.text,
                                  kTimestamp: FieldValue
                                      .serverTimestamp() // Add timestamp when sending
                                });

                                messageController.clear();
                                scrollToBottom();
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
