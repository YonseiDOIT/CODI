import 'package:flutter/material.dart';

import 'package:codi/screens/chat_room_screen.dart';
import 'package:codi/widgets/chat_profiles.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:intl/intl.dart';

// List<models.ChatMessage> messages = [
//   models.ChatMessage(
//     message_id: 1,
//     room_id: 1,
//     user_id: 1,
//     content: "안녕하세요. 저는 admin 계정으로 로그인했습니다.",
//     sent_at: DateTime(2025, 1, 22, 15, 30),
//     user: models.User(
//       user_id: 1,
//       username: "username",
//       email: "email",
//       profile_picture: "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
//       position: "FE",
//       gender: 0,
//     ),
//   ),
//   models.ChatMessage(
//     message_id: 2,
//     room_id: 1,
//     user_id: 2,
//     content: "네 안녕하세요. 저는 계정이 없는 유저입니다. 이 계정은 테스트를 위해 만든 존재하지 않는 계정입니다. DB에 없고 API로도 불러올 수 없는 계정입니다.",
//     sent_at: DateTime(2025, 1, 22, 15, 31),
//     user: models.User(
//       user_id: 2,
//       username: "username",
//       email: "email",
//       profile_picture: "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
//       position: "FE",
//       gender: 0,
//     ),
//   ),
//   models.ChatMessage(
//     message_id: 3,
//     room_id: 1,
//     user_id: 2,
//     content: "그저 테스트를 위해 만든 User 모델이라는 것만 알고 계시면 됩니다. 더 할말이 없지만 길이가 길어졌을떄 어떻게 보일지 확인해야해서 길게 쓰고 있습니다. 룰루랄라",
//     sent_at: DateTime(2025, 1, 22, 15, 32),
//     user: models.User(
//       user_id: 2,
//       username: "username",
//       email: "email",
//       profile_picture: "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
//       position: "FE",
//       gender: 0,
//     ),
//   ),
//   models.ChatMessage(
//     message_id: 1,
//     room_id: 1,
//     user_id: 1,
//     content: "이 메시지는 테스트를 위해 만든 메시지입니다. 이 메시지는 ChatRoom 위젯을 눌러서 들어온 ChatRoomScreen 위젯에서 보여집니다.",
//     sent_at: DateTime(2025, 1, 22, 16, 0),
//     user: models.User(
//       user_id: 1,
//       username: "username",
//       email: "email",
//       profile_picture: "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
//       position: "FE",
//       gender: 0,
//     ),
//   ),
//   models.ChatMessage(
//     message_id: 3,
//     room_id: 1,
//     user_id: 3,
//     content: "아 그렇군요! 아 참고로 저는 또 다른 유저입니다.",
//     sent_at: DateTime(2025, 1, 22, 16, 21),
//     user: models.User(
//       user_id: 3,
//       username: "username2",
//       email: "email",
//       profile_picture: "https://i.pinimg.com/236x/a8/4a/a3/a84aa310f33862e53c30f55bdf94b013.jpg",
//       position: "FE",
//       gender: 0,
//     ),
//   ),
// ];

class ChatRoom extends StatelessWidget {
  final models.ChatRoom chatRoomData;
  final List<models.User> members;
  const ChatRoom({super.key, required this.chatRoomData, required this.members});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomScreen(
              chatRoom: chatRoomData,
              chatRoomUsers: members,
            ),
          ),
        );
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 12.5),
        color: Colors.transparent,
        child: Row(
          children: [
            ChatProfiles(
              users: members,
              maxSize: 60,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      margin: const EdgeInsets.only(top: 7),
                      child: Text(
                        chatRoomData.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      // margin: const EdgeInsets.only(top: 3),
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatTime(chatRoomData.created_at!),
                    style: TextStyle(
                      color: globals.Colors.point2.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }
}
