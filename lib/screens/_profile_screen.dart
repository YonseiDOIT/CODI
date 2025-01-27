import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:codi/widgets/post.dart';
import 'package:codi/widgets/title.dart';
import 'package:codi/screens/profile_edit_screen.dart';
import 'package:codi/screens/post_screen.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        _background(),
        const Column(
          children: [
            UserInfo(),
            TitlesInfo(),
          ],
        ),
        const BottomDraggableSheet(),
      ],
    );
  }

  Widget _background() {
    return Container(
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
        alignment: Alignment.topCenter,
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
          SizedBox(
            height: globals.ScreenSize.height / 2,
            width: globals.ScreenSize.width,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 30.0),
                child: const Text(" "),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> with SingleTickerProviderStateMixin {
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
    return Container(
      margin: EdgeInsets.only(top: globals.ScreenSize.topPadding),
      height: 128,
      width: globals.ScreenSize.width,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _buildOpacityIndicators(),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  _buildProfileInfo(context),
                  _buildStatistics(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpacityIndicators() {
    return Container(
      width: 18,
      height: 7,
      margin: const EdgeInsets.only(top: 8),
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

  Widget _buildProfileInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        top: 6,
        // bottom: 24,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "열정적인 중재자",
                    style: TextStyle(
                      fontSize: 16,
                      color: globals.Colors.sub3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Jake lee",
                        style: TextStyle(
                          fontSize: 28,
                          color: globals.Colors.sub3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                  Row(
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
                    image: NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfileEditScreen();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      CustomIcons.edit,
                      size: 24,
                      color: globals.Colors.sub3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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

  Widget _buildStatisticColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: globals.Colors.sub3,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: globals.Colors.sub3,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class TitlesInfo extends StatelessWidget {
  const TitlesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: globals.ScreenSize.height - 128 - 75,
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: globals.Colors.sub3.withOpacity(0.05),
        child: Column(
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
                horizontal: 20,
                // vertical: 15,
              ),
              child: SizedBox(
                height: 2 * 203 + 10,
                width: 4 * 150,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 203, // Height of each grid item
                    mainAxisExtent: 150, // Width of each grid item
                    childAspectRatio: 150 / 203,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return TitlesWidget(
                      title: models.Title(
                        count: 1,
                        image_name: "brain_off",
                        title: "data",
                        title_id: 1,
                        type: "positive",
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomDraggableSheet extends StatefulWidget {
  const BottomDraggableSheet({super.key});

  @override
  State<BottomDraggableSheet> createState() => _BottomDraggableSheetState();
}

class _BottomDraggableSheetState extends State<BottomDraggableSheet> {
  final DraggableScrollableController _sheetController = DraggableScrollableController();
  double _sheetPosition = 0.0;

  List<dynamic> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Listen to extent changes
    _sheetController.addListener(() {
      setState(() {
        _sheetPosition = _sheetController.size;
      });
      // print('DraggableScrollableSheet position: $_sheetPosition');
    });

    _fetchData();
  }

  // Simulated API call
  Future<void> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    setState(() {
      items = List.generate(20, (index) => 'Item ${index + 1}'); // Generate sample data
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: globals.ScreenSize.width,
      height: globals.ScreenSize.height,
      child: DraggableScrollableSheet(
        initialChildSize: 1 - (128 + globals.ScreenSize.topPadding + 16) / globals.ScreenSize.height,
        maxChildSize: 1,
        minChildSize: 0.09,
        snapSizes: [
          0.09,
          1 - (128 + globals.ScreenSize.topPadding + 16) / globals.ScreenSize.height,
          1,
        ],
        // snap: true,
        controller: _sheetController,
        builder: (context, scrollController) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: globals.Colors.sub3,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverPersistentHeader(
                        delegate: _StickyHeaderDelegate(),
                        pinned: true, // Keeps the header at the top while scrolling
                      ),
                      if (!isLoading)
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final item = items[index];
                              return const PostWidget();
                            },
                            childCount: items.length,
                          ),
                        )
                      else
                        const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: AnimatedOpacity(
                  opacity: _sheetPosition < 0.3 ? 0 : _sheetPosition,
                  duration: const Duration(microseconds: 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PostScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: globals.Colors.point2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: globals.Colors.point2.withOpacity(0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 0),
                            spreadRadius: 20,
                          )
                        ],
                      ),
                      child: const Icon(
                        CustomIcons.add,
                        color: globals.Colors.sub3,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double topMargin = shrinkOffset.clamp(0, globals.ScreenSize.topPadding); // Adjust as you need
    double height = 66 + globals.ScreenSize.topPadding / 2;

    return Container(
      padding: EdgeInsets.only(top: topMargin), // Adjust the margin dynamically
      height: height,
      decoration: const BoxDecoration(
        color: globals.Colors.sub3,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  @override
  double get maxExtent => 66 + globals.ScreenSize.topPadding / 2; // Maximum size
  @override
  double get minExtent => 66 + globals.ScreenSize.topPadding / 2; // Minimum size

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
