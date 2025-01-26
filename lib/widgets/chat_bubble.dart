import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:codi/widgets/profile_circle.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class ChatBubble extends StatelessWidget {
  final models.ChatMessage message;
  final models.ChatMessage? previousMessage;

  const ChatBubble({
    super.key,
    required this.message,
    this.previousMessage,
  });

  @override
  Widget build(BuildContext context) {
    bool isMe = message.user.user_id == globals.codiUser.user_id;

    BoxDecoration isMeDecoration = const BoxDecoration(
      color: globals.Colors.point1,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(0),
      ),
    );

    BoxDecoration notMeDecoration = const BoxDecoration(
      color: globals.Colors.sub4,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    );

    bool showTimestamp = false;
    bool sentBySameUser = false;

    Widget chatBubble;

    if (previousMessage != null) {
      Duration timeDifference = message.sent_at!.difference(previousMessage!.sent_at!);
      if (timeDifference.inMinutes > 5) {
        showTimestamp = true;
      }
      if (message.user.user_id == previousMessage!.user.user_id) {
        sentBySameUser = true;
      }
    } else {
      showTimestamp = true;
    }

    if (isMe) {
      chatBubble = Container(
        margin: EdgeInsets.only(
          right: 16,
          left: 54,
          top: sentBySameUser ? 12 : 16,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: isMeDecoration,
            child: Text(
              message.content!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    } else {
      if (sentBySameUser && !showTimestamp) {
        chatBubble = Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: sentBySameUser ? 12 : 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 38),
              Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: notMeDecoration,
                    child: Text(
                      message.content!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        chatBubble = Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: sentBySameUser ? 12 : 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCircle(
                user: message.user,
                size: 24,
                showBorder: false,
              ),
              const SizedBox(width: 14),
              Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: notMeDecoration,
                    child: Text(
                      message.content!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }

    if (showTimestamp) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 26,
              bottom: sentBySameUser ? 8 : 4,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                DateFormat('E h:mm a').format(message.sent_at!) + ' ',
                // message.sent_at!.hour.toString().padLeft(2, '0') + ':' + message.sent_at!.minute.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: globals.Colors.sub1,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          chatBubble,
        ],
      );
    }

    return chatBubble;
  }
}
