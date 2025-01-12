library globals;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codi/data/shared_pref.dart';
import 'package:codi/models/models.dart';

late String backendKey;

bool isLoggedIn = false;

Preferences preferences = Preferences();
late SharedPreferences localData;

late User localUser;

class Colors {
  static const Color point1 = Color(0xFF6B27FE);
  static const Color point2 = Color(0xFF2E2E35);
  static const Color point3 = Color(0xFFFF3333);
  static const Color sub1 = Color(0xFF72777A);
  static const Color sub2 = Color(0xFFC1C1C3);
  static const Color sub3 = Color(0xFFFFFFFF);
  static const Color sub4 = Color(0xFFD6D6D7);
}

class ScreenSize {
  static late Size size;
  static late double height;
  static late double width;
  static late double pixelRatio;
  static late double topPadding;
  static late double bottomPadding;

  void initSizes(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    topPadding = MediaQuery.of(context).padding.top;
    bottomPadding = MediaQuery.of(context).padding.bottom;
  }
}
