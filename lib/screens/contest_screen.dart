import 'package:codi/widgets/contest.dart';
import 'package:flutter/material.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            // Text("Contests"),
            ContestWidget(),
            ContestWidget(),
          ],
        ),
      ),
    );
  }
}
