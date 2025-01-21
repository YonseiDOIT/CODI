import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';

class SubCustomTopBar extends StatelessWidget {
  final List<Widget> contents;
  final bool hasMoreActions;

  const SubCustomTopBar({
    super.key,
    required this.contents,
    this.hasMoreActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 57,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CustomIcons.left,
              size: 24,
            ),
          ),
          ...contents,
          if (!hasMoreActions)
            Container(
              width: 24,
              color: Colors.transparent,
            ),
        ],
      ),
    );
  }
}
