import 'package:flutter/material.dart';
import 'package:codi/models/models.dart';
import 'package:codi/data/globals.dart' as globals;

class ProfileCircle extends StatelessWidget {
  final User user;
  final double size;

  const ProfileCircle({
    super.key,
    required this.user,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    if (user.position == "FE" || user.position == "BE") {
      borderColor = globals.Colors.point1;
    } else if (user.position == "PD") {
      borderColor = globals.Colors.sub3;
    } else if (user.position == "PM") {
      borderColor = globals.Colors.sub3;
    } else if (user.position == "admin") {
      borderColor = globals.Colors.point3;
    } else {
      borderColor = Colors.red[900]!;
    }

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
        image: DecorationImage(
          image: NetworkImage(
            user.profile_picture ??
                "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
