import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';

import 'package:codi/data/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return Container(
      padding: EdgeInsets.only(top: globals.ScreenSize.topPadding),
      width: globals.ScreenSize.width,
      height: globals.ScreenSize.height,
      // padding: const EdgeInsets.only(top: 65, left: 136, bottom: 547),
      // clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF6923FE), Color(0xFF876EF1)],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: globals.ScreenSize.height * 0.08,
            left: globals.ScreenSize.width * 0.37,
            child: Container(
              width: 274,
              height: 188,
              decoration: const ShapeDecoration(
                color: Color(0xFF8C92FF),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: globals.ScreenSize.height,
              width: globals.ScreenSize.width,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 30.0),
                  child: const Text(" "),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: globals.ScreenSize.height * 0.065,
            child: SizedBox(
              width: globals.ScreenSize.width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jake lee",
                            style: TextStyle(
                              fontSize: 36,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            CustomIcons.edit,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            CustomIcons.award_2,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "느린 거북이",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: const Color(0xFF6055F5),
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                        fit: BoxFit.cover, //change image fill type
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4C000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: globals.ScreenSize.width,
              height: globals.ScreenSize.height,
              // color: Colors.white,
              child: DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: 0.85,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        // Bottom sheet 내용
                        Container(
                          // height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text('Bottom Sheet Content'),
                          ),
                        ),
                        // 추가 내용
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
