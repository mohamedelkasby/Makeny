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
  final ScrollController scrollController = ScrollController();

  void sendMessage() async {
    String trimmedMessage = messageController.text.trim();
    if (trimmedMessage.isNotEmpty) {
      await chatService.sendMessage(
        receiverID: widget.receiverData["uid"],
        message: trimmedMessage,
      );
      messageController.clear();

      // Scroll to bottom after sending
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  String getDateHeader(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime oneWeekAgo = today.subtract(Duration(days: 7));

    if (dateTime.isAfter(today)) {
      return "اليوم";
    } else if (dateTime.isAfter(yesterday)) {
      return "أمس";
    } else if (dateTime.isAfter(oneWeekAgo)) {
      return DateFormat('EEEE', 'ar').format(dateTime);
    } else {
      return DateFormat('d MMMM yyyy', 'ar').format(dateTime);
    }
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
          final messages = snapshot.data!.docs;
          return ListView.builder(
            controller: scrollController,
            itemCount: messages.length,
            reverse: false,
            itemBuilder: (context, index) {
              final document = messages[index];

              // Check if this message is from a different day than the previous message
              bool showDate = false;
              if (index == 0) {
                showDate = true;
              } else {
                final currentDate =
                    (document.data() as Map<String, dynamic>)["dateTime"]
                        .toDate();
                final previousDate = (messages[index - 1].data()
                        as Map<String, dynamic>)["dateTime"]
                    .toDate();

                showDate = !isSameDay(currentDate, previousDate);
              }

              return messageItem(document, showDate);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget messageItem(document, bool showDate) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isSender = data["senderID"] == firebaseAuth.currentUser!.uid;
    var alignment = (isSender) ? Alignment.centerRight : Alignment.centerLeft;

    DateTime dateTime = data["dateTime"].toDate();
    String formattedTime = DateFormat('h:mm a', 'ar').format(dateTime);

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            (isSender) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(isSender ? "You" : widget.receiverData["userName"]),
          if (showDate)
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  getDateHeader(dateTime),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          SizedBox(height: 5),
          ChatBuble(
            message: data["message"],
            time: formattedTime,
            isSender: isSender,
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: sendMessage,
                      child: SvgPicture.asset("assets/icons/send.svg"),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF0F0F0),
                        filled: true,
                        hintText: "اكتب هنا",
                        hintStyle: TextStyle(color: greyColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
