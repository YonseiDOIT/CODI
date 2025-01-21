import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:codi/widgets/profile_circle.dart';

import 'package:codi/models/models.dart' as models;

class ChatProfiles extends StatelessWidget {
  final List<models.User> users;
  final double maxSize;

  ChatProfiles({
    required this.users,
    required this.maxSize,
  });

  @override
  Widget build(BuildContext context) {
    int count = users.length > 4 ? 4 : users.length;

    return Container(
      width: maxSize,
      height: maxSize,
      child: Stack(
        children: List.generate(count, (index) {
          switch (count) {
            case 1:
              return Positioned(
                left: 0,
                top: 0,
                child: ProfileCircle(user: users[0], size: maxSize),
              );
            case 2:
              return Positioned(
                left: index * maxSize / 2,
                top: 0,
                child: ProfileCircle(user: users[index], size: maxSize / 2),
              );
            case 3:
              return Positioned(
                left: index == 0 ? 15 : (index - 1) * maxSize / 2,
                top: index == 0 ? 0 : maxSize / 2,
                child: ProfileCircle(user: users[index], size: maxSize / 2),
              );
            case 4:
              return Positioned(
                left: (index % 2) * maxSize / 2,
                top: (index ~/ 2) * maxSize / 2,
                child: ProfileCircle(user: users[index], size: maxSize / 2),
              );
            default:
              return Container();
          }
        }),
      ),
    );
  }
}
