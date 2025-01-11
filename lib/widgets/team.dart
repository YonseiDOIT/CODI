import 'package:codi/data/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:codi/data/globals.dart' as globals;

import 'package:codi/models/models.dart';

class TeamWidget extends StatelessWidget {
  final TeamRecruitmentPost item;

  const TeamWidget({
    super.key,
    required this.item,
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
          children: [
            Container(
              height: 75,
              width: 75,
              child: Stack(
                children: [
                  Image.network(
                    item.contest.poster_image_link ?? '',
                    height: 68,
                    width: 68,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            item.members[0].user.profile_picture ??
                                "https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small_2x/default-avatar-profile-icon-of-social-media-user-vector.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              width: globals.ScreenSize.width - 103 - 62,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text(
                    "1/4",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "11:18AM",
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
          children: [
            Container(
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Icon(
                      CustomIcons.left,
                      size: 24,
                    ),
                  ),
                  const Text("코디 매칭"),
                  Container(
                    width: 48,
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      // width: globals.ScreenSize.width,
                      margin: const EdgeInsets.only(top: 14),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("공모전 정보"),
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
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF72777A),
                      ),
                    ),
                    child: Image.network(
                      widget.item.contest.poster_image_link ?? '',
                      height: 411,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.title,
                        ),
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
