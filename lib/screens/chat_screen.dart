import 'package:flutter/material.dart';
import 'package:codi/data/globals.dart' as globals;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.only(top: globals.ScreenSize.topPadding),
      child: Center(
        child: Text("Chat"),
      ),
    );
  }
}
