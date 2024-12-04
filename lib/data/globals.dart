library globals;

import 'package:flutter/material.dart';

late String backendKey;

class ScreenSize {
  static late Size size;
  static late double height;
  static late double width;
  static late double pixelRatio;
  static late double topPadding;
  static late double bottomPadding;

  // MediaQuery.of(context).size             //앱 화면 크기 size  Ex> Size(360.0, 692.0)
  // MediaQuery.of(context).size.height      //앱 화면 높이 double Ex> 692.0
  // MediaQuery.of(context).size.width       //앱 화면 넓이 double Ex> 360.0
  // MediaQuery.of(context).devicePixelRatio //화면 배율    double Ex> 4.0
  // MediaQuery.of(context).padding.top      //상단 상태 표시줄 높이 double Ex> 24.0

  void initSizes(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    topPadding = MediaQuery.of(context).padding.top;
    bottomPadding = MediaQuery.of(context).padding.bottom;
  }
}
