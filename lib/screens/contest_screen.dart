import 'package:codi/widgets/contest.dart';
import 'package:codi/widgets/team.dart';
import 'package:codi/widgets/topbar.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/api_wrapper.dart' as api;
import 'package:codi/models/models.dart';

// List<Contest> contests = [
//   Contest(
//     contest_id: 1,
//     uploader_id: 1,
//     name: "asdf",
//     poster_image_link:
//         "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
//   ),
// ];
// List<Team> teams = [
//   Team(
//     team_id: 1,
//     contest: contests[0],
//   )
// ];

// List<TeamRecruitmentPost> posts = [
//   TeamRecruitmentPost(
//     recruitment_post_id: 1,
//     team_id: 1,
//     contest_id: 1,
//     contest: contests[0],
//     title: 'dummy1',
//     description: 'dummy1dummy1dummy1dummy1',
//     members: [
//       TeamMember(
//         member_id: 1,
//         user_id: 1,
//         team_id: 1,
//         user: User(
//           user_id: 1,
//           username: "username",
//           email: "email",
//         ),
//       ),
//     ],
//   ),
//   TeamRecruitmentPost(
//     recruitment_post_id: 2,
//     team_id: 2,
//     contest_id: 2,
//     contest: contests[0],
//     title: 'dummy2',
//     description: 'dummy2dummy2dummy2dummy2',
//     members: [],
//   ),
// ];

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTopBar(tabIndex: 2, controller: _tabController),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ContestList(),
              // Text("fdsa"),
              TeamList(),
            ],
          ),
        )
      ],
    );
  }
}

class ContestList extends StatefulWidget {
  const ContestList({super.key});

  @override
  State<ContestList> createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  @override
  bool get wantKeepAlive => true;

  // Dummy list of items
  List<dynamic> items = [];
  int limit = 10;
  int offset = 0;
  bool end = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to simulate loading more items
  Future<void> _loadMoreItems() async {
    if (items.isEmpty) {
      // items.addAll(await api.Contest.getContests(limit: limit, offset: offset));
      List moredata = await api.Contest.getContests(limit: limit, offset: offset);
      setState(() {
        items.addAll(moredata);
      });
      return;
    }
    // Trigger loading more items when reaching the end of the list
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      List moredata = await api.Contest.getContests(limit: limit, offset: offset);
      offset += limit;
      setState(() {
        if (moredata.isEmpty) {
          end = true;
        }
        items.addAll(moredata);
      });
    }
  }

  Future<void> _refreshItems() async {
    List moredata = await api.Contest.getContests(limit: limit, offset: 0);
    setState(() {
      items.clear();
      items.addAll(moredata);
      offset = limit;
      end = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: _refreshItems,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            if (end) return Container();

            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ContestWidget(
              contestData: items[index],
            );
          }
        },
      ),
    );
  }
}

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  @override
  bool get wantKeepAlive => true;

  // Dummy list of items
  List<dynamic> items = [];
  int limit = 10;
  int offset = 0;
  bool end = false;

  @override
  void initState() {
    super.initState();
    // _loadMoreItems();
    // _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//   // Function to simulate loading more items
//   Future<void> _loadMoreItems() async {
//     if (items.isEmpty) {
//       // items.addAll(await api.Contest.getContests(limit: limit, offset: offset));
//       List moredata = await api.RecruitmentPost.getPosts(limit: limit, offset: offset);
//       setState(() {
//         items.addAll(moredata);
//       });
//       return;
//     }
//     // Trigger loading more items when reaching the end of the list
//     if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//       List moredata = await api.RecruitmentPost.getPosts(limit: limit, offset: offset);
//       offset += limit;
//       setState(() {
//         if (moredata.isEmpty) {
//           end = true;
//         }
//         items.addAll(moredata);
//       });
//     }
//   }

  Future<void> _refreshItems() async {
    List moredata = await api.RecruitmentPost.getPosts(limit: limit, offset: 0);
    setState(() {
      items.clear();
      items.addAll(moredata);
      offset = limit;
      end = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: api.RecruitmentPost.getPosts(limit: limit, offset: 0),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData == false) {
          return const SizedBox(
            height: 270,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        items = snapshot.data!;

        return RefreshIndicator(
          onRefresh: _refreshItems,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TeamWidget(
                item: items[index],
              );
            },
          ),
        );
      },
    );
  }
}
