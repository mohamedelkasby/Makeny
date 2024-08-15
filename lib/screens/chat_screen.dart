import 'package:flutter/material.dart';
import 'package:makeny/extentions/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    if (text.isNotEmpty)
      setState(() {
        _messages.insert(0, text);
      });
    // Here you would call your chatbot service and handle the response
    // For example:
    // var response = await chatbotService.getResponse(text);
    // setState(() {
    //   _messages.insert(0, response);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.76,
                    ),
                    decoration: BoxDecoration(
                      color: mainColor200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        _messages[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: _messages.length,
            ),
          ),
          Divider(
            height: 1.0,
            color: mainColor50,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.25,
                      minHeight: 45,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: greyborderColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: TextField(
                        maxLines: null, // Allow multiple lines
                        keyboardType:
                            TextInputType.multiline, // Enable multiline input
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: InputDecoration.collapsed(
                          hintText: "Send a message",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: mainColor,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
