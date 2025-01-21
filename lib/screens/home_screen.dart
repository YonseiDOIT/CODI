import 'package:codi/widgets/topbar.dart';
import 'package:flutter/material.dart';

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
