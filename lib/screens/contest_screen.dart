import 'package:codi/widgets/contest.dart';
import 'package:codi/widgets/team.dart';
import 'package:codi/widgets/topbar.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/api_wrapper.dart' as api;

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
      items.addAll(await api.Contest.getContests(limit: limit, offset: offset));
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
              item: items[index],
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

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TeamWidget(),
        TeamWidget(),
        TeamWidget(),
      ],
    );
  }
}
