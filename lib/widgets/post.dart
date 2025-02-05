import 'package:codi/widgets/profile_circle.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWidget extends StatefulWidget {
  final models.Post postData;
  const PostWidget({super.key, required this.postData});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetails(postData: widget.postData),
          ),
        );
      },
      child: Container(
        height: 280,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 241,
                      viewportFraction: 1.02,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: widget.postData.images?.map(
                      (item) {
                        return Image.network(
                          item.image_url,
                          fit: BoxFit.cover,
                          // Todo: change height to Global variable
                          height: globals.ScreenSize.height,
                        );
                      },
                    ).toList(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
                      border: Border.all(
                        color: globals.Colors.sub4,
                      ),
                    ),
                    height: 37,
                    padding: const EdgeInsets.only(left: 63, right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postData.uploader!.username,
                          style: const TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(
                                CustomIcons.heart,
                                size: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                "${widget.postData.like_count ?? 0}",
                                style: const TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(
                                CustomIcons.show,
                                size: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 11),
                              child: Text(
                                "${widget.postData.view_count ?? 0}",
                                style: const TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 10,
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.postData.images!.map(
                    (item) {
                      int index = item.index - 1;
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? globals.Colors.point2 : globals.Colors.sub3,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 8,
                child: ProfileCircle(
                  size: 45,
                  user: widget.postData.uploader!,
                  borderWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostDetails extends ConsumerStatefulWidget {
  final models.Post postData;
  const PostDetails({super.key, required this.postData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostDetailsState();
}

class _PostDetailsState extends ConsumerState<PostDetails> {
  bool isLiked = false;
  bool showMembers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: globals.Colors.sub3,
        margin: EdgeInsets.only(
          top: globals.ScreenSize.topPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 108,
              color: globals.Colors.sub3,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(
                        CustomIcons.closeCircle,
                        color: globals.Colors.point2,
                        size: 24,
                      ),
                    ),
                  ),
                  Text(
                    widget.postData.content ?? '',
                    style: const TextStyle(
                      color: globals.Colors.point2,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showMembers = !showMembers;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          "${widget.postData.uploader?.username}님 외 ${widget.postData.members!.length - 1}명",
                          style: const TextStyle(
                            color: globals.Colors.point1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          showMembers ? CustomIcons.up : CustomIcons.down,
                          size: 22,
                          color: globals.Colors.point1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: globals.ScreenSize.height - globals.ScreenSize.topPadding - 108,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        widget.postData.images!.length * 10,
                        (index) {
                          return Image.network(widget.postData.images![index % widget.postData.images!.length].image_url);
                        },
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: showMembers ? 0 : -210,
                    left: 0,
                    right: 0,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      height: 210,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: globals.Colors.sub3,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.10),
                        //     spreadRadius: 0,
                        //     blurRadius: 16,
                        //     offset: const Offset(0, 1),
                        //   ),
                        // ],
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: widget.postData.members!.length * 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 1,
                            height: 0,
                            color: globals.Colors.sub4,
                            indent: 16,
                            endIndent: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          final member = widget.postData.members![index % 2];
                          bool isMe = false;
                          if (member.user_id == globals.codiUser.user_id) {
                            isMe = true;
                          }
                          return Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ProfileCircle(
                                      size: 30,
                                      user: member,
                                      borderWidth: 2,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      member.username,
                                      style: const TextStyle(
                                        color: globals.Colors.point2,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                if (!isMe)
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: globals.Colors.point1),
                                    width: 78,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "언팔로우",
                                      style: TextStyle(
                                        color: globals.Colors.sub3,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40 + globals.ScreenSize.bottomPadding,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 27),
                        decoration: BoxDecoration(
                          color: isLiked ? globals.Colors.point1 : globals.Colors.sub3,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CustomIcons.heart,
                              size: 16,
                              color: isLiked ? globals.Colors.sub3 : Colors.black,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "좋아요",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: isLiked ? globals.Colors.sub3 : Colors.black,
                              ),
                            )
                          ],
                        ),
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
