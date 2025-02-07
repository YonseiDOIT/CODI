import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart';
import 'package:codi/models/models.dart';
import 'package:codi/widgets/chat_profiles.dart';
import 'package:codi/widgets/profile_circle.dart';
import 'package:codi/widgets/sub_topbar.dart';
import 'package:codi/widgets/title.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class PeerReviewScreen extends StatelessWidget {
  final List<models.User> chatRoomUsers;
  // List<models.User> chatRoomUsers = [
  //   globals.codiUser,
  //   models.User(
  //     user_id: 2,
  //     username: "username",
  //     email: "email",
  //     profile_picture:
  //         "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
  //     position: "FE",
  //     gender: 0,
  //   ),
  //   models.User(
  //     user_id: 3,
  //     username: "username2",
  //     email: "email",
  //     profile_picture:
  //         "https://i.pinimg.com/236x/a8/4a/a3/a84aa310f33862e53c30f55bdf94b013.jpg",
  //     position: "FE",
  //     gender: 0,
  //   ),
  //   models.User(
  //     user_id: 3,
  //     username: "username2",
  //     email: "email",
  //     profile_picture:
  //         "https://i.pinimg.com/236x/a8/4a/a3/a84aa310f33862e53c30f55bdf94b013.jpg",
  //     position: "FE",
  //     gender: 0,
  //   ),
  //   models.User(
  //     user_id: 3,
  //     username: "username2",
  //     email: "email",
  //     profile_picture:
  //         "https://i.pinimg.com/236x/a8/4a/a3/a84aa310f33862e53c30f55bdf94b013.jpg",
  //     position: "FE",
  //     gender: 0,
  //   ),
  // ];
  PeerReviewScreen({
    super.key,
    required this.chatRoomUsers,
  });

  @override
  Widget build(BuildContext context) {
    int count = chatRoomUsers.length;
    return Scaffold(
      body: Container(
        width: globals.ScreenSize.width,
        height: globals.ScreenSize.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubCustomTopBar(
                  contents: [
                    Text(
                      "상호 평가",
                      style: TextStyle(
                        color: globals.Colors.point2,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                  hasMoreActions: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '동료 평가',
                        style: TextStyle(
                          color: globals.Colors.point2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        height: globals.ScreenSize.height * 0.8,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...List.generate(
                                count,
                                (index) {
                                  if (chatRoomUsers[index].user_id !=
                                      globals.codiUser.user_id) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                          child: ChatRoomUsers(
                                              chatRoomUsers: chatRoomUsers,
                                              index: index),
                                        ),
                                        const Divider(
                                          color: globals.Colors.sub4,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              child: Container(
                width: globals.ScreenSize.width * 0.87,
                height: globals.ScreenSize.height * 0.06,
                padding:
                    const EdgeInsets.symmetric(horizontal: 129, vertical: 14),
                decoration: ShapeDecoration(
                  color: globals.Colors.point2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  '저장하기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: globals.Colors.sub3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatRoomUsers extends StatefulWidget {
  int index;
  final List<User> chatRoomUsers;

  ChatRoomUsers({
    super.key,
    required this.chatRoomUsers,
    required this.index,
  });

  @override
  State<ChatRoomUsers> createState() => _ChatRoomUsersState();
}

class _ChatRoomUsersState extends State<ChatRoomUsers> {
  bool isSelected = false;

  void _toggleContainer() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            ProfileCircle(user: widget.chatRoomUsers[widget.index], size: 40),
            const SizedBox(
              width: 12,
            ),
            Text(
              widget.chatRoomUsers[widget.index].username,
              style: const TextStyle(
                color: globals.Colors.point2,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _toggleContainer,
          child: Container(
            width: globals.ScreenSize.width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "비어있음",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Icon(
                  CustomIcons.down,
                  color: globals.Colors.sub4,
                ),
              ],
            ),
          ),
        ),
        if (isSelected)
          Container(
            // margin: EdgeInsets.only(top: 20),
            width: globals.ScreenSize.width,
            height: 306,
            color: globals.Colors.sub3,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, // Height of each grid item
                mainAxisExtent: 135, // Width of each grid item
                childAspectRatio: 150 / 135,
              ),
              itemCount: widget.chatRoomUsers[widget.index].titles!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: TitlesWidget(
                    title: widget.chatRoomUsers[widget.index].titles![index],
                    user: widget.chatRoomUsers[widget.index],
                    isprofile: false,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
