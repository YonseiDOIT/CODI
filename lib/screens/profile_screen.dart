import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';

import 'package:codi/data/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return Container(
      width: globals.ScreenSize.width,
      height: globals.ScreenSize.height,
      // padding: const EdgeInsets.only(top: 65, left: 136, bottom: 547),
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF6923FE), Color(0xFF876EF1)],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: globals.ScreenSize.height * 0.08,
            left: globals.ScreenSize.width * 0.37,
            child: Container(
              width: 274,
              height: 188,
              decoration: ShapeDecoration(
                color: Color(0xFF8C92FF),
                shape: OvalBorder(),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 30.0),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
