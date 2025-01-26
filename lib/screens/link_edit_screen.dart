import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:flutter/material.dart';

class LinkEditScreen extends StatelessWidget {
  const LinkEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "링크",
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: globals.Colors.sub4,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: globals.Colors.sub4,
                      ),
                    ),
                  ),
                  child: const Icon(
                    CustomIcons.add,
                    color: globals.Colors.point2,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "외부 링크 추가",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: globals.Colors.sub4,
                      ),
                    ),
                  ),
                  child: const Icon(
                    CustomIcons.attachment,
                    color: globals.Colors.point2,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "behance.com",
                  style: TextStyle(
                    color: globals.Colors.point2,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "링크가 CODI 내외의 모든 사람에게 공개됩니다.",
              style: TextStyle(
                color: globals.Colors.sub2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
