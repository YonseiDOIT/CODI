import 'package:flutter/material.dart';

import 'package:codi/widgets/topbar.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTopBar(tabIndex: 2),
          Center(
            child: Text("contest"),
          ),
        ],
      ),
    );
  }
}
