import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/defualt_appbar.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

FirebaseAuth fireAuth = FirebaseAuth.instance;

class _AiChatScreenState extends State<AiChatScreen> {
  final Gemini gemini = Gemini.instance;
  UserModel userModel = UserModel();
  ChatUser? currentUser;
  List<ChatMessage> messages = [];
  List<String> words = [];

  Future<void> getUserData() async {
    userModel = await FireStoreService()
        .getUserDetails(userID: fireAuth.currentUser!.uid);
    words = userModel.name!.split(' ');
    currentUser = ChatUser(
      id: fireAuth.currentUser!.uid,
      firstName: words.first,
      lastName: words.length > 1 ? words.last : null,
      profileImage: userModel.picture,
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  ChatUser aiUser = ChatUser(
    id: "0",
    firstName: "Makeny",
    lastName: "AI",
    profileImage: "assets/grid_images/graident-ai-robot-vectorart 1.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(
        context,
        title: tr("smart_assistant"),
      ),
      body: currentUser == null
          ? Center(
              child: CircularProgressIndicator(
              color: mainColor300,
            ))
          : _chatUi(),
    );
  }

  _chatUi() {
    return DashChat(
      currentUser: currentUser!,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatmessage) {
    setState(
      () {
        messages = [chatmessage, ...messages];
      },
    );
    try {
      String question = chatmessage.text;
      gemini.promptStream(parts: [Part.text(question)]).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == aiUser) {
          lastMessage = messages.removeAt(0);
          String? response = event?.content?.parts?.whereType<TextPart>().fold(
                    "",
                    (previous, current) => "$previous ${current.text}",
                  ) ??
              "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String? response = event?.content?.parts?.whereType<TextPart>().fold(
                    "",
                    (previous, current) => "$previous ${current.text}",
                  ) ??
              "";
          ChatMessage message = ChatMessage(
              user: aiUser, createdAt: DateTime.now(), text: response);

          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print('Error initiating stream: $e');

      // Add error message to chat
      ChatMessage errorMessage = ChatMessage(
          user: aiUser,
          createdAt: DateTime.now(),
          text: 'Sorry, an error occurred while processing your message.');
      setState(() {
        messages = [errorMessage, ...messages];
      });
    }
  }
}
