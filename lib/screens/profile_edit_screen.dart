import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String _selectedRole = 'Developer';
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
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: const Color(0xFF6055F5),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
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
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   width: 3,
                            //   color: const Color(0xFF6055F5),
                            // ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.image_outlined,
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
                                            Icons.camera_alt_outlined,
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
                                            Icons.delete_outline,
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
            },
            child: const Text(
              "사진 수정",
              style: TextStyle(
                color: globals.Colors.point1,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Developer',
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
                value: 'Designer',
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
              const SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "이름",
                          style: TextStyle(
                            color: globals.Colors.point2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Jake Lee",
                          style: TextStyle(
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
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "남성",
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
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {},
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
}
