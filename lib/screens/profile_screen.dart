import 'dart:ui';

import 'package:codi/widgets/post.dart';
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
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: EdgeInsets.only(top: globals.ScreenSize.topPadding),
        width: globals.ScreenSize.width,
        height: globals.ScreenSize.height,
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
                          children: [
                            Icon(
                              CustomIcons.award_2,
                              size: 14,
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
                child: DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.7,
                  maxChildSize: 0.85,
                  snap: true,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFAEAEAE)
                                        .withOpacity(0.3),
                                    blurRadius: 160,
                                    offset: const Offset(0, 60),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // const Icon(
                                  //   CustomIcons.up,
                                  //   size: 24,
                                  //   color: Color(0xFFC1C1C3),
                                  // ),
                                  TabBar(
                                    indicator: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorPadding:
                                        const EdgeInsets.only(bottom: 40),
                                    labelColor:
                                        Theme.of(context).colorScheme.primary,
                                    unselectedLabelColor:
                                        Theme.of(context).colorScheme.secondary,
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    unselectedLabelStyle:
                                        const TextStyle(fontSize: 14),
                                    tabs: const [
                                      Tab(text: '포트폴리오'),
                                      Tab(text: '업적'),
                                      Tab(text: '평가'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  // controller: scrollController,
                                  children: const [
                                    // 포트폴리오 내용
                                    PostWidget(),
                                    PostWidget(),
                                    PostWidget(),
                                    PostWidget(),
                                    PostWidget(),
                                    PostWidget(),
                                  ],
                                ),
                                ListView(
                                  children: [
                                    Container(
                                      child: const Center(
                                        child: Text('업적 내용'),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  children: [
                                    Container(
                                      child: const Center(
                                        child: Text('평가 내용'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: FloatingActionButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  elevation: 10.0,
                  child: const Icon(CustomIcons.add)),
            ),
          ],
        ),
      ),
    );
  }
}
