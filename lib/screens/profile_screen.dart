<<<<<<< HEAD
import 'dart:ui';

import 'package:codi/widgets/post.dart';
=======
import 'package:codi/data/custom_icons.dart';
>>>>>>> 28c987fe7be4043fadf67d125b5bbd343f94942f
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
      child: const Center(
        child: Text('profile'),
      ),
    );
  }
}
