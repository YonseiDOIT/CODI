import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:codi/data/custom_icons.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

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
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 43,
                              child: TextField(
                                controller: _titleController,
                                maxLines: 1,
                                maxLength: 25,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "제목을 입력하세요. (최대 25자)",
                                  hintStyle: TextStyle(
                                    color: globals.Colors.sub2,
                                  ),
                                  counter: Offstage(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                                  isCollapsed: true,
                                ),
                                style: const TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Divider(color: globals.Colors.sub4, height: 1, thickness: 1),
                            SizedBox(
                              height: 420,
                              child: TextField(
                                controller: _descriptionController,
                                maxLines: null,
                                expands: true,
                                maxLength: 100,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "내용을 입력하세요. (최대 100자)",
                                  hintStyle: TextStyle(
                                    color: globals.Colors.sub2,
                                  ),
                                  counter: Offstage(),
                                ),
                                scrollPadding: EdgeInsets.zero,
                                style: const TextStyle(
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
                          onTap: () async {
                            Fluttertoast.cancel();
                            if (_titleController.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "제목이 비어있습니다",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: globals.Colors.point2,
                                textColor: globals.Colors.sub3,
                                fontSize: 16.0,
                              );
                            } else if (_descriptionController.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "내용이 비어있습니다",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: globals.Colors.point2,
                                textColor: globals.Colors.sub3,
                                fontSize: 16.0,
                              );
                            } else {
                              await api.RecruitmentPost.addPost(
                                contest_id: widget.contestData.contest_id,
                                user_id: globals.codiUser.user_id,
                                title: _titleController.text,
                                description: _descriptionController.text,
                                max_members: 4,
                              );
                            }
                          },
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
