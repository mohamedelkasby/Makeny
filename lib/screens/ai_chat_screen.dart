import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  UserModel userModel = UserModel();
  List<ChatMessage> messages = [];
  ChatUser? currentUser;

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

  List<String> words = [];

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
          : _buildUi(),
    );
  }

  _buildUi() {
    return DashChat(
      currentUser: currentUser!,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatmessage) {}
}
