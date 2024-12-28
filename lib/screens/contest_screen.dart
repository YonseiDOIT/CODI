import 'package:codi/widgets/contest.dart';
import 'package:codi/widgets/topbar.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/api_wrapper.dart' as api;

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          CustomTopBar(tabIndex: 2),
          Expanded(child: ContestList()),
        ],
      ),
    );
  }
}

class ContestList extends StatefulWidget {
  const ContestList({super.key});

  @override
  State<ContestList> createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> {
  final _scrollController = ScrollController();

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

  // items.addAll((await api.Contest.getContests()) as Iterable<Map<String, dynamic>>);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == items.length) {
          if (end) return Container();

          // If reached the end of the list, show a loading indicator
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Displaying the actual item
          return ContestWidget(
            item: items[index],
          );
        }
      },
    );
  }
}
