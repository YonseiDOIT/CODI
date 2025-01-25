import 'dart:ui';
import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitlesWidget extends StatelessWidget {
  const TitlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 203,
      decoration: BoxDecoration(
        color: globals.Colors.point1,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'data',
                style: TextStyle(
                  color: globals.Colors.sub3,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Flexible(
                child: SvgPicture.asset(
                  'assets/vectors/Vector1.svg',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
              const Text(
                '2장',
                style: TextStyle(
                  color: Color(0xFF3906A6),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              CustomIcons.checkCircle,
              color: globals.Colors.sub3.withOpacity(0),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
