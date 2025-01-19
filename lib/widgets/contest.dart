import 'package:codi/data/api_wrapper.dart';
import 'package:codi/data/custom_icons.dart';
import 'package:codi/models/models.dart' as models;
import 'package:codi/widgets/team.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:codi/data/globals.dart' as globals;

class ContestWidget extends StatelessWidget {
  final models.Contest contestData;

  ContestWidget({
    super.key,
    required this.contestData,
  });

  late List tags;
  late int dDay;

  @override
  Widget build(BuildContext context) {
    tags = contestData.tags.toString().split(", ");

    int dDay = contestData.registration_end_date!.difference(DateTime.now()).inDays;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContestDetails(
              contestData: contestData,
            ),
          ),
        );
      },
      child: Container(
        height: 201,
        width: globals.ScreenSize.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              // width: 1,
            ),
          ),
        ),
        margin: const EdgeInsets.only(
          left: 16,
        ),
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 18,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                ),
              ),
              child: Image.network(
                contestData.poster_image_link!,
                height: 168,
                width: 119,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: globals.ScreenSize.width - 119 - 16 - 12,
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contestData.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        contestData.hosting_organization!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(tags.length, (index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromRGBO(48, 52, 55, 0.2),
                          ),
                          child: Text(
                            tags[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Text(
                          "참가대상",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        contestData.entry_requirements!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Text(
                          "접수기간",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        "${toDate(contestData.registration_start_date!)} ~ ${toDate(contestData.registration_end_date!)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  if (dDay > 10)
                    Text(
                      "D-$dDay",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    )
                  else if (10 >= dDay && dDay >= 0)
                    Text(
                      "D-$dDay",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  else
                    Text(
                      "접수 종료됨",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
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

  String toDate(DateTime date) {
    return DateFormat('yyyy.MM.dd').format(date);
  }
}

class ContestDetails extends StatefulWidget {
  final models.Contest contestData;
  const ContestDetails({
    super.key,
    required this.contestData,
  });

  @override
  State<ContestDetails> createState() => _ContestDetailsState();
}

class _ContestDetailsState extends State<ContestDetails> {
  late List tags;
  late int dDay;

  @override
  Widget build(BuildContext context) {
    tags = widget.contestData.tags.toString().split(", ");
    dDay = DateTime.now().difference(widget.contestData.registration_end_date!).inDays;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: globals.ScreenSize.topPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                    "공모전 정보",
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
            Container(
              height: 180,
              width: globals.ScreenSize.width,
              padding: const EdgeInsets.only(
                top: 32,
                // bottom: 18,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.contestData.name!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                widget.contestData.hosting_organization!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(tags.length, (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color.fromRGBO(48, 52, 55, 0.2),
                                  ),
                                  child: Text(
                                    tags[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontSize: 10,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: const Text(
                                      "참가대상",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.contestData.entry_requirements!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    child: const Text(
                                      "접수기간",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${toDate(widget.contestData.registration_start_date!, "short")} ~ ${toDate(widget.contestData.registration_end_date!, "short")}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (dDay > 10)
                            Text(
                              "D-$dDay",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )
                          else if (10 >= dDay && dDay >= 0)
                            Text(
                              "D-$dDay",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          else
                            Text(
                              "접수 종료됨",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  Image.network(
                    widget.contestData.poster_image_link!,
                    height: 129,
                    width: 91,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      labelColor: globals.Colors.point2,
                      labelPadding: const EdgeInsets.all(0),
                      indicator: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.zero),
                        // color: globals.Colors.point1,
                        border: Border(
                          bottom: BorderSide(color: globals.Colors.point1, width: 3),
                        ),
                      ),

                      // indicatorPadding: EdgeInsets.only(bottom: 2),
                      indicatorWeight: 0,
                      tabs: [
                        Container(
                          width: globals.ScreenSize.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: globals.Colors.point2.withOpacity(0.1),
                            ),
                          ),
                          child: const Tab(
                            child: Text(
                              "소개",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: globals.Colors.point2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: globals.ScreenSize.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: globals.Colors.point2.withOpacity(0.1),
                            ),
                          ),
                          child: const Tab(
                            child: Text(
                              "팀 찾기",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: globals.Colors.point2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20, bottom: 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "접수 기간",
                                          style: TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "${toDate(widget.contestData.registration_start_date!, "long")} ~ ${toDate(widget.contestData.registration_end_date!, "long")}",
                                          style: const TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20, bottom: 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "주최 기간",
                                          style: TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          widget.contestData.hosting_organization ?? "정보 없음",
                                          style: const TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20, bottom: 25),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          "상금",
                                          style: TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          widget.contestData.prizes ?? "정보 없음",
                                          style: const TextStyle(
                                            color: globals.Colors.point2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(color: globals.Colors.sub4, width: 5),
                                      ),
                                    ),
                                    child: Image.network(
                                      widget.contestData.poster_image_link!,
                                      // height: 1096,
                                      width: globals.ScreenSize.width,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: RecruitmentPost.getPostsByContest(contest_id: widget.contestData.contest_id),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return const Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(
                                          snapshot.data.length,
                                          (index) {
                                            return TeamWidget(
                                              item: snapshot.data[index],
                                              showContest: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddTeam(
                                                contestData: widget.contestData,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: globals.Colors.point2,
                                            borderRadius: BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.12),
                                                offset: const Offset(10, 14),
                                                blurRadius: 56,
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            CustomIcons.add,
                                            size: 24,
                                            color: globals.Colors.sub3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String toDate(DateTime date, String type) {
    if (type == "short") {
      return DateFormat('yyyy.MM.dd').format(date);
    } else if (type == "long") {
      return DateFormat('yyyy년 M월 d일').format(date);
    } else {
      return "$date";
    }
  }
}

class AddTeam extends StatefulWidget {
  final models.Contest contestData;
  const AddTeam({
    super.key,
    required this.contestData,
  });

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  late List tags;

  @override
  Widget build(BuildContext context) {
    tags = widget.contestData.tags.toString().split(", ");
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: globals.ScreenSize.topPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                      "팀원 모집",
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
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "공모전",
                          style: TextStyle(
                            color: globals.Colors.point1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 91,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.contestData.name!,
                                            style: const TextStyle(
                                              color: globals.Colors.point2,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            widget.contestData.hosting_organization!,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        child: Row(
                                          children: List.generate(tags.length, (index) {
                                            return Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                              margin: const EdgeInsets.only(right: 5, bottom: 4),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                color: const Color.fromRGBO(48, 52, 55, 0.2),
                                              ),
                                              child: Text(
                                                tags[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context).colorScheme.secondary,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.network(
                                widget.contestData.poster_image_link ?? '',
                                height: 91,
                                width: 91,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: globals.Colors.sub2,
                    height: 1,
                    thickness: 1,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 17,
                        ),
                        width: globals.ScreenSize.width,
                        height: globals.ScreenSize.height - globals.ScreenSize.topPadding - 57 - 91 - 36 - 1 - 34 - 20,
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 43,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "제목",
                                  hintStyle: TextStyle(
                                    color: globals.Colors.sub2,
                                  ),
                                ),
                                style: TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(color: globals.Colors.sub4, height: 1, thickness: 1),
                            SizedBox(
                              height: 420,
                              child: TextField(
                                maxLines: null,
                                expands: true,
                                maxLength: 100,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "내용을 입력하세요. (최대 100자)",
                                  hintStyle: TextStyle(
                                    color: globals.Colors.sub2,
                                  ),
                                ),
                                style: TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 23),
                            width: globals.ScreenSize.width - 46,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              // horizontal: 129,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: globals.Colors.point2,
                            ),
                            child: const Text(
                              "업로드",
                              style: TextStyle(
                                color: globals.Colors.sub3,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
