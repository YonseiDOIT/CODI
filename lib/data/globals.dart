library globals;

import 'package:flutter/material.dart';
import 'package:codi/data/shared_pref.dart';
import 'package:codi/models/models.dart' as models;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

late String backendKey;

bool isLoggedIn = false;
Preferences localData = Preferences();
late models.User codiUser;
late WebSocketChannel channel;

final List<models.Title> defaultTitles = [
  models.Title(title_id: 1, title: "지혜로운 해결사", image_name: "wise_troubleshooter", type: "positive", count: 0),
  models.Title(title_id: 2, title: "감각적인 디자이너", image_name: "sensual_designer", type: "positive", count: 0),
  models.Title(title_id: 3, title: "프로 개발자", image_name: "professional_developer", type: "positive", count: 0),
  models.Title(title_id: 4, title: "열정적인 중재자", image_name: "passionate_mediator", type: "positive", count: 0),
  models.Title(title_id: 5, title: "아이디어 뱅크", image_name: "idea_bank", type: "positive", count: 0),
  models.Title(title_id: 6, title: "브레인", image_name: "brain", type: "positive", count: 0),
  models.Title(title_id: 7, title: "발표의 신", image_name: "god_of_presentation", type: "positive", count: 0),
  models.Title(title_id: 8, title: "정리의 신", image_name: "god_of_organization", type: "positive", count: 0),
];

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
