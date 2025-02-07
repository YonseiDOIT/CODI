import 'package:codi/widgets/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:codi/widgets/topbar.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return const Column(
      children: [
        CustomTopBar(tabIndex: 1),
        Expanded(child: ChatRoomList()),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ChatRoomList extends StatelessWidget {
  const ChatRoomList({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return FutureBuilder(
      future: api.Chat.getChatRooms(userId: globals.codiUser.user_id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 270,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final chatRooms = snapshot.data;
          return ListView.builder(
            itemCount: chatRooms?.length,
            itemBuilder: (context, index) {
              models.ChatRoom chatRoom = models.ChatRoom.FromJson(chatRooms?[index]["chat_room"]);

              List<models.User> members = (chatRooms?[index]["members"] as List).map((member) => models.User.FromJson(member)).toList();

              return ChatRoom(
                chatRoomData: chatRoom,
                members: members,
              );
            },
          );
        }
      },
    );
  }
}
