import 'dart:ui';

import 'package:codi/widgets/post.dart';
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
    return Container(
      child: Center(
        child: Text("profile"),
      ),
    );
  }
}
