import 'package:flutter/material.dart';

import 'package:codi/widgets/profile_circle.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class ChatBubble extends StatelessWidget {
  final models.ChatMessage message;

  const ChatBubble({
    super.key,
    required this.message,
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

    if (isMe) {
      return Container(
        margin: const EdgeInsets.only(
          right: 16,
          left: 54,
          top: 8,
          bottom: 8,
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
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCircle(
              user: message.user,
              size: 24,
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
}
