import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  bool shouldAutoScroll = true;
  // bool showFloatingButton = false;
  bool isInitialLoad = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void scrollListener() {
    // If user scrolls up manually, disable auto-scroll
    if (scrollController.position.pixels <
        scrollController.position.maxScrollExtent - 100) {
      shouldAutoScroll = false;
      // showFloatingButton = true;
    }
    // Re-enable auto-scroll when user scrolls to bottom
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 50) {
      shouldAutoScroll = true;
      // showFloatingButton = false;
    }
  }

  void scrollToBottom({bool animate = true}) {
    if (scrollController.hasClients) {
      if (animate) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    }
  }

  void forceScrollToBottom() {
    // Wait for the next frame when the new message is added
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 50,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }

      // showFloatingButton = false;
    });
  }

  Future<void> sendMessage() async {
    String trimmedMessage = messageController.text.trim();
    if (trimmedMessage.isNotEmpty) {
      try {
        await chatService.sendMessage(
          receiverID: widget.receiverData["uid"],
          message: trimmedMessage,
        );
        messageController.clear();
        // Enable auto-scroll when sending a new message
        forceScrollToBottom();
      } catch (e) {
        // Handle error appropriately
        debugPrint('Error sending message: $e');
      }
    }
  }

  // check if the date of send the message is at the same day or not

  String getDateHeader(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime oneWeekAgo = today.subtract(const Duration(days: 7));

    if (dateTime.isAfter(today)) {
      return tr("today");
    } else if (dateTime.isAfter(yesterday)) {
      return tr("yesterday");
    } else if (dateTime.isAfter(oneWeekAgo)) {
      return DateFormat(
        'EEEE',
        context.locale.languageCode == "ar" ? "ar" : "en",
      ).format(dateTime);
    } else {
      return DateFormat(
        'd MMMM yyyy',
        context.locale.languageCode == "ar" ? "ar" : "en",
      ).format(dateTime);
    }
  }

  bool shouldShowDate(List<QueryDocumentSnapshot> messages, int index) {
    if (index == 0) return true;

    final currentData = messages[index].data() as Map<String, dynamic>;
    final previousData = messages[index - 1].data() as Map<String, dynamic>;

    final currentDateTime = getDateTimeFromTimestamp(currentData['dateTime']);
    final previousDateTime = getDateTimeFromTimestamp(previousData['dateTime']);

    return !isSameDay(currentDateTime, previousDateTime);
  }

  bool isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  DateTime? getDateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp == null) return null;
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }
    return null;
  }

  Widget messageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
        senderID: firebaseAuth.currentUser!.uid,
        receiverID: widget.receiverData["uid"],
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
              child: Text(
            tr("no_messages_yet"),
          ));
        }

        final messages = snapshot.data!.docs;

        // Handle initial scroll position
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (isInitialLoad) {
            scrollToBottom(
                animate: false); // Jump without animation on initial load
            isInitialLoad = false;
          } else if (shouldAutoScroll) {
            scrollToBottom(animate: true); // Animate for subsequent scrolls
          }
        });

        return ListView.builder(
          controller: scrollController,
          itemCount: messages.length,
          padding: const EdgeInsets.only(bottom: 16),
          itemBuilder: (context, index) {
            final document = messages[index];
            final showDate = shouldShowDate(messages, index);
            return messageItem(document, showDate);
          },
        );
      },
    );
  }

  Widget messageItem(QueryDocumentSnapshot document, bool showDate) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isSender = data["senderID"] == firebaseAuth.currentUser!.uid;
    var alignment = (isSender) ? Alignment.centerRight : Alignment.centerLeft;

    dynamic timestamp = data["dateTime"];
    DateTime? messageDateTime = getDateTimeFromTimestamp(timestamp);

    String formattedTime = messageDateTime != null
        ? DateFormat(
            'h:mm a',
            context.locale.languageCode == "ar" ? "ar" : "en",
          ).format(messageDateTime)
        : "........";

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            (isSender) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if (showDate && messageDateTime != null)
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  getDateHeader(messageDateTime),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 5),
          ChatBuble(
            message: data["message"],
            time: formattedTime,
            isSender: isSender,
            isMessagePending: messageDateTime == null,
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: backArrow(context),
          title: Text(
            widget.receiverData["userName"] ??
                widget.receiverData["phoneNumber"],
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
                        child: Transform.flip(
                            flipX: context.locale.languageCode == "en"
                                ? true
                                : false,
                            child: SvgPicture.asset("assets/icons/send.svg")),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF0F0F0),
                          filled: true,
                          hintText: tr("write_here"),
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
        // floatingActionButton: showFloatingButton
        //     ? FloatingActionButton.small(
        //         onPressed: () {
        //           forceScrollToBottom();
        //         },
        //         child: Icon(Icons.arrow_downward),
        //       )
        //     : null,
      ),
    );
  }
}
