import 'dart:math';

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

  void _scrollDown() {
    _chatBubbleListController.animateTo(
      _chatBubbleListController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
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
                        users: [globals.codiUser],
                        maxSize: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.chatRoom.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${widget.chatRoom.message_count}개의 메시지",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(CustomIcons.award_1, size: 24),
                const Icon(CustomIcons.calender, size: 24),
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
                    itemCount: widget.chatRoom.messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: widget.chatRoom.messages[index],
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
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: globals.Colors.sub1,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
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
                    onTap: () {
                      String message = _messageController.text;
                      if (message.isNotEmpty) {
                        // api.sendMessage(
                        //   widget.chatRoom.chatroom_id,
                        //   message,
                        // );
                        setState(() {
                          widget.chatRoom.messages.insert(
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
                        });

                        _messageController.clear();
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
