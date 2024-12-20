import 'package:codi/widgets/chat_room.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ChatRoom(),
          ChatRoom(),
          ChatRoom(),
        ],
      ),
    );
  }
}
