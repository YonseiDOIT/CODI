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
