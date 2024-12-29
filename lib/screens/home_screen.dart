import 'package:flutter/material.dart';

import 'package:codi/data/globals.dart' as globals;

import 'package:codi/widgets/topbar.dart';
import 'package:codi/widgets/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.only(top: globals.ScreenSize.topPadding),
      child: const Center(
        child: Column(
          children: [
            CustomTopBar(tabIndex: 0),
            // Text("Home"),
            PostWidget(),
            PostWidget(),
          ],
        ),
      ),
    );
  }
}
