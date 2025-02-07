import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// data
import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';

// screens
import 'package:codi/screens/splash_screen.dart';
import 'package:codi/screens/home_screen.dart';
import 'package:codi/screens/chat_screen.dart';
import 'package:codi/screens/contest_screen.dart';
// import 'package:codi/screens/profile_screen.dart';
import 'package:codi/screens/_profile_screen.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

Future<void> main() async {
  await dotenv.load(fileName: 'assets/env/.env');
  globals.backendKey = dotenv.get("backendKey");

  KakaoSdk.init(nativeAppKey: dotenv.get("kakaoNativeKey"));
//   print("keyHash:${await KakaoSdk.origin}");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      // theme: ThemeData(),
      theme: mainTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const ContestScreen(),
    ProfileScreen(user: globals.codiUser),
  ];

  List<IconData> navBarIcons = [
    CustomIcons.home,
    CustomIcons.chatbubbles,
    CustomIcons.award_1,
    CustomIcons.profile_1,
  ];

  @override
  void initState() {
    super.initState();
    api.Chat.connectToWebSocket(globals.codiUser.user_id);
  }

  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return Scaffold(
      backgroundColor: globals.Colors.sub3,
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFAEAEAE).withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 70,
            offset: const Offset(0, -20),
          ),
        ],
        color: globals.Colors.sub3,
      ),
      child: Stack(
        children: [
          Row(
            children: List.generate(
              4,
              (index) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    alignment: Alignment.topCenter,
                    child: Icon(
                      navBarIcons[index],
                      color: _currentIndex == index ? globals.Colors.point1 : globals.Colors.point2,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            left: (2 * _currentIndex + 1) * globals.ScreenSize.width / 8 - 2.5,
            bottom: 25,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: globals.Colors.point1,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
