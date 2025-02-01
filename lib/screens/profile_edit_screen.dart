import 'dart:io';

import 'package:codi/providers/codi_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:codi/screens/link_edit_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:image_picker/image_picker.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/widgets/profile_circle.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late String _selectedRole;
  late int _selectedGender;

  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  List<String> genderList = ["선택안함", "남자", "여자"];
  @override
  void initState() {
    final codiUser = ref.read(codiUserProvider);
    super.initState();
    if (codiUser.position == "FE" || codiUser.position == "BE") {
      _selectedRole = "FE";
    } else {
      _selectedRole = codiUser.position;
    }
    _selectedGender = codiUser.gender;
  }

  @override
  Widget build(BuildContext context) {
    final codiUser = ref.watch(codiUserProvider);

    Future<void> updateUserPosition(String position) async {
      var result = await api.User.updateUser(
        user_id: codiUser.user_id,
        position: position,
      );

      print(result["user"]);

      if (result["message"] == "User updated successfully") {
        // ref.read(codiUserProvider.notifier).state.profile_picture = result["user"]["profile_picture"];
        ref.read(codiUserProvider.notifier).state = models.User.FromJson(result["user"]);
        globals.codiUser = ref.read(codiUserProvider.notifier).state;
      }
    }

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
                  user: codiUser,
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
                    updateUserPosition(_selectedRole);
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
                    updateUserPosition(_selectedRole);
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
                          codiUser.username,
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
    final codiUser = ref.watch(codiUserProvider);

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
                user: codiUser,
                showBorder: false,
                showShadow: false,
              ),
              const Divider(
                color: globals.Colors.sub4,
                thickness: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                getImage(ImageSource.gallery, context, codiUser);
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: const Row(
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
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                getImage(ImageSource.camera, context, codiUser);
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: const Row(
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
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                color: Colors.transparent,
                                child: const Row(
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
                              ),
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
    final codiUser = ref.watch(codiUserProvider);

    Future<void> updateUser(int gender) async {
      var result = await api.User.updateUser(
        user_id: codiUser.user_id,
        gender: gender,
      );

      if (result["message"] == "User updated successfully") {
        // ref.read(codiUserProvider.notifier).state.profile_picture = result["user"]["profile_picture"];
        ref.read(codiUserProvider.notifier).state = models.User.FromJson(result["user"]);
        globals.codiUser = ref.read(codiUserProvider.notifier).state;
      }
    }

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
                    updateUser(_selectedGender);
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
                    updateUser(_selectedGender);
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
                    updateUser(_selectedGender);
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

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource, BuildContext context, codiUser) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });

      var result = await api.User.updateUser(
        user_id: codiUser.user_id,
        profile_picture: File(XFile(pickedFile.path).path),
      );

      // print(result);
      if (result["message"] == "User updated successfully") {
        // ref.read(codiUserProvider.notifier).state.profile_picture = result["user"]["profile_picture"];
        ref.read(codiUserProvider.notifier).state = models.User.FromJson(result["user"]);
        globals.codiUser = ref.read(codiUserProvider.notifier).state;

        // Close the modal after successful update
        Navigator.pop(context); // Close the modal

        // print(result["user"]["profile_picture"]);
        // print(ref.read(codiUserProvider.notifier).state.profile_picture);
        // print(globals.codiUser.profile_picture);

        // print(globals.codiUser.profile_picture);
      }
    }
  }
}
