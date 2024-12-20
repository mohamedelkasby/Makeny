import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makeny/extentions/colors.dart';
import 'package:makeny/models/user_model.dart';
import 'package:makeny/services/fire_store_service.dart';
import 'package:makeny/widgets/custom_texts/cusrom_texts.dart';
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
    return Stack(
      children: [
        // Background layer
        messages.isEmpty
            ? Center(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: MediaQuery.sizeOf(context).height * .05,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .85,
                          child: Image.asset(
                            "assets/chat_design/no_chat_photo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.sizeOf(context).height * .13,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                          ),
                          Image.asset(
                            "assets/chat_design/robot_design.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: rehardingContainer(
                              text: tr("hello"),
                              width: MediaQuery.sizeOf(context).width * .42,
                            ),
                          ),
                          rehardingContainer(
                            text: tr("how_can_i_help_you"),
                            width: MediaQuery.sizeOf(context).width * .7,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: MediaQuery.sizeOf(context).width * .96,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/chat_design/background_chat.png',
                    ),
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        // Chat UI layer
        DashChat(
          currentUser: currentUser!,
          onSend: _sendMessage,
          messages: messages,
          messageOptions: MessageOptions(
            containerColor: greyColor,
            currentUserContainerColor: mainColor300,
            textColor: Colors.white,
            timeTextColor: greyColor,
          ),
          inputOptions: InputOptions(
            sendButtonBuilder: (send) {
              return IconButton(
                  onPressed: send,
                  icon: Transform.flip(
                    flipX: context.locale.languageCode == "en" ? false : true,
                    child: SvgPicture.asset("assets/icons/send.svg"),
                  ));
            },
            alwaysShowSend: true,
            cursorStyle: const CursorStyle(hide: true),
            inputDecoration: InputDecoration(
                hintText: tr("write_here"),
                // hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffF0F0F0),
                filled: true),
            // inputTextDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }

  Container rehardingContainer({
    required String text,
    required double width,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: mainColor50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: textHeaderDescription(
            text: text,
            weight: FontWeight.w600,
          ),
        ),
      ),
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
