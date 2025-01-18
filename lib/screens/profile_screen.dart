import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  double _opacity1 = 1.0;
  double _opacity2 = 0.3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      if (_tabController?.index == 0) {
        _opacity1 = 1.0;
        _opacity2 = 0.3;
      } else {
        _opacity1 = 0.3;
        _opacity2 = 1.0;
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return DefaultTabController(
      length: 2,
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
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  UserInfoTab(
                    opacity1: _opacity1,
                    opacity2: _opacity2,
                    tabController: _tabController,
                  ),
                  Column(
                    children: [
                      const Text(
                        "획득한 칭호",
                        style: TextStyle(
                          color: globals.Colors.point1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Column(
                            children: [
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: 203,
                                    decoration: BoxDecoration(
                                      color: globals.Colors.point1,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'data',
                                          style: TextStyle(
                                            color: globals.Colors.sub3,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Flexible(
                                          child: SvgPicture.asset(
                                            'assets/vectors/Vector${index + 1}.svg',
                                            alignment: Alignment.center,
                                            fit: BoxFit.cover,
                                            // color: Colors.white,
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                        Text(
                                          '2장',
                                          style: TextStyle(
                                            color: Color(0xFF3906A6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: 203,
                                    decoration: BoxDecoration(
                                      color: globals.Colors.point1,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'data',
                                          style: TextStyle(
                                            color: globals.Colors.sub3,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Flexible(
                                          child: SvgPicture.asset(
                                            'assets/vectors/Vector${index + 5}.svg',
                                            alignment: Alignment.center,
                                            fit: BoxFit.cover,
                                            // color: Colors.white,
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                        Text(
                                          '2장',
                                          style: TextStyle(
                                            color: Color(0xFF3906A6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomDraggableSheet(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoTab extends StatelessWidget {
  const UserInfoTab({
    super.key,
    required double opacity1,
    required double opacity2,
    required TabController? tabController,
  })  : _opacity1 = opacity1,
        _opacity2 = opacity2,
        _tabController = tabController;

  final double _opacity1;
  final double _opacity2;
  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _buildOpacityIndicators(),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Widget _buildOpacityIndicators() {
    return SizedBox(
      width: 18,
      height: 7,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacity1,
            duration: const Duration(microseconds: 0),
            child: Container(
              width: 7,
              height: 7,
              decoration: const ShapeDecoration(
                color: globals.Colors.sub4,
                shape: OvalBorder(),
              ),
            ),
          ),
          const SizedBox(width: 4),
          AnimatedOpacity(
            opacity: _opacity2,
            duration: const Duration(microseconds: 0),
            child: Container(
              width: 7,
              height: 7,
              decoration: const ShapeDecoration(
                color: globals.Colors.sub4,
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Container(
      width: globals.ScreenSize.width,
      height: globals.ScreenSize.height * 0.16,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildProfileInfo(),
          _buildStatistics(),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "열정적인 중재자",
                  style: TextStyle(
                    fontSize: 16,
                    color: globals.Colors.sub3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Jake lee",
                      style: TextStyle(
                        fontSize: 28,
                        color: globals.Colors.sub3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CustomIcons.edit,
                        color: globals.Colors.sub3,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      CustomIcons.attachment,
                      size: 18,
                      color: globals.Colors.sub3,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "behance.com 외 2개",
                      style: TextStyle(
                        fontSize: 14,
                        color: globals.Colors.sub3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 77,
              height: 77,
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
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Center(
                child: Icon(
                  CustomIcons.edit,
                  size: 24,
                  color: globals.Colors.sub3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildStatisticColumn('10', '작업물'),
        _buildStatisticColumn('50', '좋아요'),
        _buildStatisticColumn('344', '팔로워'),
        _buildStatisticColumn('300', '팔로잉'),
      ],
    );
  }

  static Widget _buildStatisticColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
              color: globals.Colors.sub3,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: const TextStyle(
              color: globals.Colors.sub3,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class BottomDraggableSheet extends StatelessWidget {
  const BottomDraggableSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: globals.ScreenSize.width,
      height: globals.ScreenSize.height,
      child: DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.085,
        maxChildSize: 0.85,
        // snap: true,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: globals.Colors.sub3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: globals.ScreenSize.width,
                    padding: const EdgeInsets.only(top: 8, bottom: 14),
                    decoration: BoxDecoration(
                      color: globals.Colors.sub3,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFAEAEAE).withOpacity(0.3),
                          blurRadius: 160,
                          offset: const Offset(0, 60),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          CustomIcons.up,
                          size: 24,
                          color: globals.Colors.sub2,
                        ),
                        Text(
                          '나의 포트폴리오',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: globals.Colors.point1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
