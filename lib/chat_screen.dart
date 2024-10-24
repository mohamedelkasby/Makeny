import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/services/chat_service.dart';
import 'package:makeny/widgets/chat_buble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.receiverData,
  });
  final Map<String, dynamic> receiverData;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final ChatService chatService = ChatService();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void sendMessage() async {
      if (messageController.text.isNotEmpty) {
        await chatService.sendMessage(
          receiverID: widget.receiverData["uid"],
          message: messageController.text,
        );
        messageController.clear();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.receiverData["email"] ?? widget.receiverData["phoneNumber"]),
      ),
      body: Column(
        children: [
          Expanded(
            child: messageList(),
          ),
          // the message input
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "enter your message",
                      hintStyle: TextStyle(color: greyColor),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: Icon(
                  Icons.send,
                  color: mainColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget messageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
        senderID: firebaseAuth.currentUser!.uid,
        receiverID: widget.receiverData["uid"],
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.docs
                .map((document) => messageItem(document))
                .toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget messageItem(document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isSender = data["senderID"] == firebaseAuth.currentUser!.uid;
    var alignment = (isSender) ? Alignment.centerLeft : Alignment.centerRight;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              (isSender) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Center(child: Text(data["timestamp"].toString())),
            Text(data["senderEmail"]),
            ChatBuble(
              message: data["message"],
              isSender: isSender,
            ),
          ],
        ),
      ),
    );
  }
}
