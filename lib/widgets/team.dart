import 'package:codi/data/custom_icons.dart';
import 'package:codi/widgets/contest.dart';
import 'package:codi/widgets/profile_circle.dart';
import 'package:flutter/material.dart';
import 'package:codi/data/globals.dart' as globals;

import 'package:codi/models/models.dart';

class TeamWidget extends StatelessWidget {
  final TeamRecruitmentPost item;
  final bool showContest;

  const TeamWidget({
    super.key,
    required this.item,
    this.showContest = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeamDetails(item: item),
          ),
        );
      }),
      child: Container(
        height: 105,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showContest)
              Container(
                height: 75,
                width: 75,
                child: Stack(
                  children: [
                    Image.network(
                      item.contest!.poster_image_link ?? '',
                      height: 68,
                      width: 68,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ProfileCircle(
                        user: item.members[0].user,
                        width: 42,
                      ),
                    ),
                  ],
                ),
              )
            else
              ProfileCircle(
                user: item.members[0].user,
                width: 42,
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                // width: globals.ScreenSize.width - 103 - 62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            child: const Text(
                              "팀장 ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            child: Text(
                              item.members[0].user.username,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    "${item.members.length}/${item.max_members}",
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    // "${item.created_at}",
                    "6:18:AM",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TeamDetails extends StatefulWidget {
  final TeamRecruitmentPost item;
  const TeamDetails({super.key, required this.item});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: globals.ScreenSize.topPadding,
          right: 16,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.left,
                      size: 24,
                    ),
                  ),
                  const Text(
                    "코디 매칭",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: globals.Colors.point2,
                    ),
                  ),
                  Container(
                    width: 24,
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetails(
                            contestData: widget.item.contest!,
                          ),
                        ),
                      );
                      // ContestDetails
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      // width: globals.ScreenSize.width,
                      margin: const EdgeInsets.only(top: 14),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "공모전 정보",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            CustomIcons.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 411,
                    width: globals.ScreenSize.width - 32,
                    margin: const EdgeInsets.only(top: 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: globals.Colors.sub1,
                      ),
                    ),
                    child: Image.network(
                      widget.item.contest!.poster_image_link ?? '',
                      height: 411,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.item.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: globals.Colors.point2,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4, bottom: 16),
                          child: Text(
                            widget.item.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "참여 인원",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: globals.Colors.point1,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 9),
                              child: Text(
                                "${widget.item.members.length}/${widget.item.max_members}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: globals.Colors.point1,
                                ),
                              ),
                            )
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: List.generate(
                              widget.item.members.length,
                              (index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 7),
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: ProfileCircle(
                                    user: widget.item.members[index].user,
                                    width: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!widget.item.members.any((member) => member.user.user_id == globals.codiUser.user_id)) {
                              // if (true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      width: globals.ScreenSize.width - 53 * 2,
                                      height: 202,
                                      decoration: BoxDecoration(
                                        color: globals.Colors.sub3,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 27),
                                          const Text(
                                            "코디 매칭을 신청하시겠어요?",
                                            style: TextStyle(
                                              color: globals.Colors.point2,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            "확인 버튼을 누르면 내 프로필이 전송됩니다.",
                                            style: TextStyle(
                                              color: globals.Colors.point2,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 28),
                                          const Divider(
                                            height: 0,
                                            thickness: 1,
                                            color: globals.Colors.sub4,
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              width: globals.ScreenSize.width - 53 * 2,
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              color: Colors.transparent,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                '확인',
                                                style: TextStyle(
                                                  color: globals.Colors.point1,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 0,
                                            thickness: 1,
                                            color: globals.Colors.sub4,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: globals.ScreenSize.width - 53 * 2,
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              color: Colors.transparent,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                '취소',
                                                style: TextStyle(
                                                  color: globals.Colors.point2,
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
                                },
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 13),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: globals.Colors.point2,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.item.members.any((member) => member.user.user_id == globals.codiUser.user_id) ? "이미 신청이 완료됨" : "신청하기",
                              style: const TextStyle(
                                color: globals.Colors.sub3,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
