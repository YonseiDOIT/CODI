import 'package:codi/screens/link_edit_screen.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/widgets/profile_circle.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class ProfileEditScreen extends StatefulWidget {
  final models.User user;
  const ProfileEditScreen({super.key, required this.user});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late String _selectedRole;
  late int _selectedGender;

  List<String> genderList = ["선택안함", "남자", "여자"];

  @override
  void initState() {
    super.initState();
    if (widget.user.position == "FE" || widget.user.position == "BE") {
      _selectedRole = "FE";
    } else {
      _selectedRole = widget.user.position;
    }
    _selectedGender = widget.user.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "프로필 편집",
          style: TextStyle(
            color: globals.Colors.point2,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: globals.Colors.sub3,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CustomIcons.leftArrow,
            color: globals.Colors.point2,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _showProfileImageSelection(context);
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ProfileCircle(
                  size: 75,
                  user: widget.user,
                  borderWidth: 3,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "사진 수정",
                  style: TextStyle(
                    color: globals.Colors.point1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'FE',
                groupValue: _selectedRole,
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
              ),
              const Text(
                '개발자',
              ),
              Radio<String>(
                value: 'PD',
                groupValue: _selectedRole,
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
              ),
              const Text(
                '디자이너',
              ),
            ],
          ),
          const Divider(
            color: globals.Colors.sub4,
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "이름",
                          style: TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.user.username,
                          style: const TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: globals.Colors.sub4,
                indent: globals.ScreenSize.width / 6,
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "성별",
                          style: TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            _showGenderSelection();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                genderList[_selectedGender],
                                style: const TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Icon(
                                CustomIcons.right,
                                color: globals.Colors.sub2,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: globals.Colors.sub4,
                indent: globals.ScreenSize.width / 6,
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "링크",
                          style: TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LinkEditScreen()),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "링크 추가",
                                style: TextStyle(
                                  color: globals.Colors.point2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                CustomIcons.right,
                                color: globals.Colors.sub2,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: globals.Colors.sub4,
                indent: globals.ScreenSize.width / 6,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showProfileImageSelection(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: globals.ScreenSize.width,
          height: globals.ScreenSize.height * 0.4,
          padding: const EdgeInsets.all(20),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          child: Column(
            children: [
              ProfileCircle(
                size: 45,
                user: widget.user,
                showBorder: false,
              ),
              const Divider(
                color: globals.Colors.sub4,
                thickness: 1,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  CustomIcons.image,
                                  color: globals.Colors.point2,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "라이브러리에서 선택",
                                  style: TextStyle(
                                    color: globals.Colors.point2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  CustomIcons.camera,
                                  color: globals.Colors.point2,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "사진 찍기",
                                  style: TextStyle(
                                    color: globals.Colors.point2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  CustomIcons.delete,
                                  color: globals.Colors.point3,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "현재 사진 삭제",
                                  style: TextStyle(
                                    color: globals.Colors.point3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "회원님의 프로필 사진은 CODI 내외의 모든 사람에게 공개됩니다.",
                style: TextStyle(
                  color: globals.Colors.sub2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        );
      },
    );
  }

  void _showGenderSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: globals.ScreenSize.width,
          height: globals.ScreenSize.height * 0.3,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                title: const Text(
                  "선택안함",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: globals.Colors.sub2,
              ),
              ListTile(
                title: const Text(
                  "남성",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: globals.Colors.sub2,
              ),
              ListTile(
                title: const Text(
                  "여성",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 2;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
