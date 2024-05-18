import 'package:flutter/material.dart';

import '../../data/chatBot/aiModel.dart';
import '../../data/chatBot/aiService.dart';
import '../../data/chatBot/aiapi.dart';


class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {



  final AiApi  _apiai = AiApi();



  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [
    ChatMessage(sender: "Bot", text: "Hello, how can I help you?", isBot: true),
    ChatMessage(sender: "User", text: "Hi, I need assistance.", isBot: false),
  ];

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // Add user message to the list
      setState(() {
        _messages.add(ChatMessage(sender: "User", text: _messageController.text, isBot: false));
      });

      // Send message to AI and await the response
      Map<String, dynamic> model = await _apiai.sendMessage(_messageController.text);
      AiModel data = AiModel.fromJson(model);

      // Clear the message controller
      _messageController.clear();

      // Add AI responses to the list
      setState(() {

          _messages.add(ChatMessage(sender: "Bot", text: data.result, isBot: true));

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: _messages[index].isBot ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    _messages[index].isBot
                        ? Icon(Icons.android) // Bot icon
                        : Icon(Icons.person), // User icon
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _messages[index].isBot ? Colors.blueGrey : Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          _messages[index].text,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final bool isBot;

  ChatMessage({required this.sender, required this.text, required this.isBot});
}