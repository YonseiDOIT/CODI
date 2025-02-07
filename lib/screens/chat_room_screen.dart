import 'dart:convert';
import 'dart:math';

import 'package:codi/screens/peer_review_screen.dart';
import 'package:codi/widgets/chat_bubble.dart';
import 'package:codi/widgets/sub_topbar.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/widgets/chat_profiles.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class ChatRoomScreen extends StatefulWidget {
  final models.ChatRoom chatRoom;
  final List<models.User> chatRoomUsers;

  const ChatRoomScreen({
    super.key,
    required this.chatRoom,
    required this.chatRoomUsers,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final ScrollController _chatBubbleListController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  List<models.ChatMessage> messages = [];

  void _scrollDown() {
    _chatBubbleListController.animateTo(
      _chatBubbleListController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   globals.channel.stream.listen((message) {
  //     print(message);
  //     setState(() {
  //       messages.insert(
  //         0,
  //         models.ChatMessage(
  //           message_id: -1,
  //           room_id: widget.chatRoom.chatroom_id,
  //           user_id: message["sender_id"],
  //           user: message["sneder"],
  //           content: message["content"],
  //           sent_at: message["sent_at"],
  //         ),
  //       );
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    api.Chat.getMessages(roomId: widget.chatRoom.chatroom_id).then((fetchedMessages) {
      setState(() {
        for (Map<String, dynamic> message in fetchedMessages) {
          messages.insert(0, models.ChatMessage.FromJson(message));
        }
      });
    }).catchError((error) {
      // Handle error
      print("Failed to load messages: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: globals.ScreenSize.topPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubCustomTopBar(
              hasMoreActions: true,
              contents: [
                SizedBox(
                  width: 160,
                  child: Row(
                    children: [
                      ChatProfiles(
                        users: widget.chatRoomUsers,
                        maxSize: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Text(
                          widget.chatRoom.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(CustomIcons.award_1, size: 24),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PeerReviewScreen(chatRoomUsers: widget.chatRoomUsers),
                        ),
                      );
                    },
                    child: const Icon(CustomIcons.calender, size: 24)),
                const Icon(CustomIcons.filter, size: 24),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    reverse: true,
                    controller: _chatBubbleListController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: messages[index],
                        previousMessage: index < messages.length - 1 ? messages[index + 1] : null,
                        // previousMessage: index > 0 ? widget.chatRoom.messages[index - 1] : null,
                      );
                    },
                  ),
                  Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 108,
              alignment: Alignment.center,
              width: globals.ScreenSize.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      minLines: 1, // Start with a single line
                      maxLines: null, // Allow the TextField to expand vertically
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        hintStyle: const TextStyle(
                          color: globals.Colors.sub1,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: globals.Colors.sub1,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: globals.Colors.point2,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onTap: _scrollDown,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String message = _messageController.text;
                      _messageController.clear();
                      if (message.isNotEmpty) {
                        // api.sendMessage(
                        //   widget.chatRoom.chatroom_id,
                        //   message,
                        // );
                        await Future.delayed(const Duration(milliseconds: 500));
                        setState(() {
                          // globals.channel.sink.add({
                          //   "sender_id": globals.codiUser.user_id,
                          //   "room_id": widget.chatRoom.chatroom_id,
                          //   "content": message,
                          //   "sent_at": DateTime.now().toIso8601String(),
                          // });
                          // globals.channel.sink.add(jsonEncode({
                          //   "sender_id": globals.codiUser.user_id,
                          //   "room_id": widget.chatRoom.chatroom_id,
                          //   "content": message,
                          //   "sent_at": DateTime.now().toIso8601String(),
                          // }));

                          messages.insert(
                            0,
                            models.ChatMessage(
                              message_id: Random().nextInt(100000),
                              room_id: widget.chatRoom.chatroom_id,
                              user_id: globals.codiUser.user_id,
                              user: globals.codiUser,
                              content: message,
                              sent_at: DateTime.now(),
                            ),
                          );
                          // messages.insert(
                          //   0,
                          //   models.ChatMessage(
                          //     message_id: Random().nextInt(100000),
                          //     room_id: widget.chatRoom.chatroom_id,
                          //     user_id: globals.codiUser.user_id,
                          //     user: globals.codiUser,
                          //     content: message,
                          //     sent_at: DateTime.now(),
                          //   ),
                          // );
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: globals.Colors.point2,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        CustomIcons.send,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
