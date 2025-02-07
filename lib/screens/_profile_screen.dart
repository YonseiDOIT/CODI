import 'dart:ui';

import 'package:codi/providers/codi_user_provider.dart';
import 'package:flutter/material.dart';

import 'package:codi/screens/profile_edit_screen.dart';
import 'package:codi/screens/post_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codi/widgets/post.dart';
import 'package:codi/widgets/title.dart';
import 'package:codi/widgets/profile_circle.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class ProfileScreen extends StatefulWidget {
  final models.User user;
  const ProfileScreen({
    super.key,
    required this.user,
  });

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
        const _Background(),
        Column(
          children: [
            _UserInfo(widget.user),
            _TitlesInfo(widget.user),
          ],
        ),
        _BottomDraggableSheet(widget.user),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
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
        ),
        Positioned(
          top: globals.ScreenSize.height * 0.19,
          bottom: globals.ScreenSize.height * 0.1,
          left: 0,
          right: 0,
          child: SizedBox(
            child: Image.asset(
              'assets/images/background_splash.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserInfo extends ConsumerStatefulWidget {
  final models.User user;
  const _UserInfo(this.user);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<_UserInfo> with SingleTickerProviderStateMixin {
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
                  _buildProfileInfo(context, ref),
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

  Widget _buildProfileInfo(BuildContext context, WidgetRef ref) {
    final selectedTitle = ref.watch(selectedTitleProvider); // Watch for changes
    final codiUser = ref.watch(codiUserProvider);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedTitle?.title ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: globals.Colors.sub3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.user.username,
                        style: const TextStyle(
                          fontSize: 28,
                          color: globals.Colors.sub3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
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
                        "behance.com",
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
              GestureDetector(
                onTap: () {
                  if (globals.codiUser.user_id == widget.user.user_id) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ProfileEditScreen();
                        },
                      ),
                    );
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (globals.codiUser.user_id == widget.user.user_id)
                      ProfileCircle(
                        size: 77,
                        user: codiUser,
                        borderWidth: 3,
                      )
                    else
                      ProfileCircle(
                        size: 77,
                        user: widget.user,
                        borderWidth: 3,
                      ),
                    if (globals.codiUser.user_id == widget.user.user_id)
                      const Icon(
                        CustomIcons.edit,
                        size: 24,
                        color: globals.Colors.sub3,
                      ),
                  ],
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

class _TitlesInfo extends StatelessWidget {
  final models.User user;
  const _TitlesInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: globals.ScreenSize.height - 128 - 75,
        padding: const EdgeInsets.symmetric(vertical: 20),
        // color: globals.Colors.sub3.withOpacity(0.05),
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
                  itemCount: user.titles!.length,
                  itemBuilder: (context, index) {
                    return TitlesWidget(
                      title: user.titles![index],
                      user: user,
                      isprofile: true,
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

class _BottomDraggableSheet extends StatefulWidget {
  final models.User user;
  const _BottomDraggableSheet(this.user);

  @override
  State<_BottomDraggableSheet> createState() => _BottomDraggableSheetState();
}

class _BottomDraggableSheetState extends State<_BottomDraggableSheet> {
  final DraggableScrollableController _sheetController = DraggableScrollableController();
  double _sheetPosition = 1 - (128 + globals.ScreenSize.topPadding + 16) / globals.ScreenSize.height;

  List<models.Post> items = [];
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
      items = [globals.post]; // Generate sample data
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
                decoration: BoxDecoration(
                  color: globals.Colors.sub3,
                  borderRadius: _sheetPosition < 1
                      ? const BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        )
                      : BorderRadius.zero,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverPersistentHeader(
                        delegate: _StickyHeaderDelegate(_sheetPosition),
                        pinned: true, // Keeps the header at the top while scrolling
                      ),
                      if (!isLoading)
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final item = items[index];
                              return PostWidget(
                                postData: item,
                              );
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
  final double _sheetPosition;

  _StickyHeaderDelegate(this._sheetPosition);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double topMargin = shrinkOffset.clamp(0, globals.ScreenSize.topPadding); // Adjust as you need
    double height = 66 + globals.ScreenSize.topPadding / 2;

    return Container(
      padding: EdgeInsets.only(top: topMargin), // Adjust the margin dynamically
      height: height,
      color: globals.Colors.sub3,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _sheetPosition < 1 ? CustomIcons.up : CustomIcons.down,
            size: 24,
            color: globals.Colors.sub2,
          ),
          const Text(
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
