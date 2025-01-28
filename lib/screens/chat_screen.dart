import 'package:codi/widgets/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:codi/widgets/topbar.dart';
import 'package:codi/data/globals.dart' as globals;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(tabIndex: 1),
        ChatRoom(),
        ChatRoom(),
        ChatRoom(),
      ],
    );
  }
}
