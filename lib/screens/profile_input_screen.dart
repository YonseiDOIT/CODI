import 'package:codi/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:codi/data/custom_icons.dart';
import 'package:image_picker/image_picker.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class ProfileInputScreen extends StatefulWidget {
  const ProfileInputScreen({super.key});

  @override
  State<ProfileInputScreen> createState() => _ProfileInputScreenState();
}

class _ProfileInputScreenState extends State<ProfileInputScreen> {
  String _selectedjob = 'FE';
  int _selectedgender = 0;

  TextEditingController usernameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  XFile? _image;
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: globals.ScreenSize.height * 0.175,
            bottom: globals.ScreenSize.height * 0.16,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                'assets/images/background_login.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: globals.ScreenSize.width,
            height: globals.ScreenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: globals.ScreenSize.topPadding + 46),
                  child: const Text(
                    "프로필 입력",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: globals.Colors.point2,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 52),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: 94,
                        height: 94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: _selectedjob == "FE" ? globals.Colors.point1 : globals.Colors.sub3,
                            width: 4,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.30),
                              offset: Offset(0, 4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              _image == null
                                  ? Image.asset(
                                      'assets/images/default_profile.png',
                                      fit: BoxFit.cover,
                                      width: 94,
                                      height: 94,
                                    )
                                  : Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                      width: 94,
                                      height: 94,
                                    ),
                              Container(
                                width: 86,
                                height: 24,
                                color: globals.Colors.sub3,
                                child: const Icon(
                                  CustomIcons.camera,
                                  color: globals.Colors.sub2,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // 가로 중앙 정렬
                        children: [
                          Radio(
                            value: 'FE',
                            groupValue: _selectedjob,
                            activeColor: globals.Colors.point1,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedjob = value!;
                              });
                            },
                          ),
                          const Text(
                            '개발자',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Radio(
                            value: 'PD',
                            groupValue: _selectedjob,
                            activeColor: globals.Colors.point1,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedjob = value!;
                              });
                            },
                          ),
                          const Text(
                            '디자이너',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            decoration: textFieldDecoration(CustomIcons.profile_1, "계정 이름 *"),
                            onChanged: (text) {},
                            onEditingComplete: () {},
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            controller: birthDateController,
                            decoration: textFieldDecoration(CustomIcons.star, "생년월일 *"),
                            onChanged: (text) {},
                            onEditingComplete: () {},
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: const Text(
                              "성별",
                              style: TextStyle(
                                color: globals.Colors.sub2,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: _selectedgender,
                                activeColor: globals.Colors.point1,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedgender = value!;
                                  });
                                },
                              ),
                              const Text(
                                '선택안함',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Radio(
                                value: 1,
                                groupValue: _selectedgender,
                                activeColor: globals.Colors.point1,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedgender = value!;
                                  });
                                },
                              ),
                              const Text(
                                '남자',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Radio(
                                value: 2,
                                groupValue: _selectedgender,
                                activeColor: globals.Colors.point1,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedgender = value!;
                                  });
                                },
                              ),
                              const Text(
                                '여자',
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        "아래 다음을 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                        style: TextStyle(
                          color: globals.Colors.sub2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: globals.ScreenSize.height * 0.14),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          var result = await api.User.updateUser(
                            user_id: globals.codiUser.user_id,
                            profile_picture: _image != null ? File(_image!.path) : null,
                            gender: _selectedgender,
                            position: _selectedjob,
                            username: usernameController.text,
                          );

                          try {
                            await globals.localData.saveMap("codi_user", result["user"]);
                            globals.codiUser = models.User.FromJson(result["user"]);
                            _toMain();
                          } catch (error) {
                            debugPrint('로컬 저장 실패 $error');
                          }
                        } catch (error) {
                          debugPrint('유저 업데이트 실패 $error');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: globals.Colors.point1,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            "CODI 시작하기",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: globals.Colors.sub3,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration textFieldDecoration(IconData prefixIcon, String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: globals.Colors.sub3,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: globals.Colors.sub2,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 22, right: 12),
        child: Icon(
          prefixIcon,
          color: globals.Colors.sub2,
          size: 24,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: globals.Colors.sub2,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: globals.Colors.point2,
          width: 1.5,
        ),
      ),
    );
  }

  void _toMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Main(),
      ),
    );
  }
}
