import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 72,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
            ),
            // const SizedBox(width: 10),
            const Text("Sample Chat Room Name"),
            // const Spacer(),
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Handle call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam),
              onPressed: () {
                // Handle video call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options action
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Chat Room Screen'),
      ),
    );
  }
}
