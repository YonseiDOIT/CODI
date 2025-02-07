import 'package:flutter/material.dart';

import 'package:codi/widgets/topbar.dart';
import 'package:codi/widgets/post.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Column(
          children: [
            CustomTopBar(tabIndex: 0),
            Expanded(
              child: PostList(),
            ),
          ],
        ),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  List<dynamic> items = [];
  int limit = 10;
  int offset = 0;
  bool end = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !isLoading && !end) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (isLoading || end) return;

    setState(() {
      isLoading = true;
    });

    List moreData = await api.Post.getPosts(limit: limit, offset: offset);

    setState(() {
      if (moreData.isEmpty) {
        end = true;
      } else {
        items.addAll(moreData);
        offset += limit;
      }
      isLoading = false;
    });

    // If there aren't enough items to scroll, load more immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.position.maxScrollExtent == 0 && !end) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _refreshItems() async {
    List moreData = await api.Post.getPosts(limit: limit, offset: 0);
    setState(() {
      items.clear();
      items.addAll(moreData);
      offset = moreData.isNotEmpty ? limit : 0;
      end = moreData.isEmpty;
      isLoading = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.position.maxScrollExtent == 0 && !end) {
        _loadMoreItems();
      }
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
        itemCount: items.length + (isLoading ? 1 : 0),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          if (index < items.length) {
            globals.post = items[0];
            return PostWidget(
              postData: items[index],
            );
          }

          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

// class _PostListState extends State<PostList> {
//   final _scrollController = ScrollController();
//   @override
//   bool get wantKeepAlive => true;

//   // Dummy list of items
//   List<dynamic> items = [];
//   int limit = 10;
//   int offset = 0;
//   bool end = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadMoreItems();
//     _scrollController.addListener(_loadMoreItems);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // Function to simulate loading more items
//   Future<void> _loadMoreItems() async {
//     if (items.isEmpty) {
//       // items.addAll(await api.Contest.getContests(limit: limit, offset: offset));
//       List moredata = await api.Post.getPosts(limit: limit, offset: offset);
//       setState(() {
//         items.addAll(moredata);
//       });
//       return;
//     }
//     // Trigger loading more items when reaching the end of the list
//     if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
//       List moredata = await api.Post.getPosts(limit: limit, offset: offset);
//       offset += limit;
//       setState(() {
//         if (moredata.isEmpty) {
//           end = true;
//         }
//         items.addAll(moredata);
//       });
//     }
//   }

//   Future<void> _refreshItems() async {
//     List moredata = await api.Post.getPosts(limit: limit, offset: 0);
//     setState(() {
//       items.clear();
//       items.addAll(moredata);
//       offset = limit;
//       end = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshItems,
//       // displacement: 100,

//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         controller: _scrollController,
//         itemCount: items.length + 1,
//         padding: EdgeInsets.zero,
//         itemBuilder: (context, index) {
//           if (index == items.length) {
//             if (end) return Container();

//             return const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else {
//             return const PostWidget();
//           }
//         },
//       ),
//     );
//   }
// }
