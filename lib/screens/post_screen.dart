import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "포트폴리오",
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
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "팀원 등록",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: globals.Colors.point1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "kimmingu",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: globals.Colors.point1,
                      ),
                    ),
                    Text(
                      " 님 외 ",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: globals.Colors.point1,
                      ),
                    ),
                    Text(
                      "3명",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: globals.Colors.point1,
                      ),
                    ),
                    Icon(
                      CustomIcons.right,
                      color: globals.Colors.point1,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: globals.Colors.sub2,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  maxLength: 25,
                  decoration: const InputDecoration(
                    hintText: "제목을 입력하세요. (최대 25자)",
                    hintStyle: TextStyle(
                      color: globals.Colors.sub2,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                  ],
                  buildCounter: (BuildContext context,
                      {int? currentLength, int? maxLength, bool? isFocused}) {
                    return null;
                  },
                ),
                const Divider(
                  color: globals.Colors.sub2,
                  thickness: 1,
                ),
                SizedBox(
                  height: globals.ScreenSize.height * 0.6,
                  width: globals.ScreenSize.width,
                  child: Scrollbar(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "내용을 입력하세요.",
                        hintStyle: TextStyle(
                          color: globals.Colors.sub2,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      expands: false,
                      scrollController: ScrollController(),
                      showCursor: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 70,
          width: globals.ScreenSize.width,
          decoration: const BoxDecoration(
            color: globals.Colors.sub3,
            border: Border(
              top: BorderSide(
                color: globals.Colors.sub2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      CustomIcons.text,
                      size: 24,
                      color: globals.Colors.point2,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Icon(
                      CustomIcons.image,
                      size: 24,
                      color: globals.Colors.point2,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Icon(
                      CustomIcons.text_align_left,
                      size: 24,
                      color: globals.Colors.point2,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "저장",
                    style: TextStyle(
                        color: globals.Colors.point1,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
