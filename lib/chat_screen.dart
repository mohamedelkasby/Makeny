import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/services/chat_service.dart';
import 'package:makeny/widgets/buttons.dart';
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

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(
        receiverID: widget.receiverData["uid"],
        message: messageController.text,
      );
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backArrow(context),
        title: Text(
          widget.receiverData["userName"] ?? widget.receiverData["phoneNumber"],
        ),
        backgroundColor: greybackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: messageList(),
            ),
            // the message input
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () => sendMessage(),
                    child: SvgPicture.asset("assets/icons/send.svg"),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    // focusNode: focusNode, // Added focusNode

                    controller: messageController,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF0F0F0),
                      filled: true,
                      hintText: "enter your message",
                      hintStyle: TextStyle(color: greyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
            reverse: true,
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
    var alignment = (isSender) ? Alignment.centerRight : Alignment.centerLeft;

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime oneWeekAgo = today.subtract(Duration(days: 7));

    // convert the timestamp to datetime to formate it
    DateTime dateTime = data["dateTime"].toDate();

    String formattedDate =
        DateFormat('d MMMM yyyy', 'ar').format(dateTime); //date
    String formattedDay = DateFormat('EEEE', 'ar').format(dateTime); // day
    String formattedTime =
        DateFormat('h:mm a', 'ar').format(dateTime); // time with  AM/PM

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            (isSender) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(isSender ? "You" : widget.receiverData["userName"]),
          Center(
            child: dateTime.isAfter(today)
                ? Text("اليوم")
                : dateTime.isAfter(yesterday)
                    ? Text("امس")
                    : dateTime.isAfter(oneWeekAgo)
                        ? Text(formattedDay)
                        : Text(formattedDate),
          ),
          SizedBox(
            height: 5,
          ),
          ChatBuble(
            message: data["message"],
            time: formattedTime,
            isSender: isSender,
          ),
          // to make a space between messages
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
