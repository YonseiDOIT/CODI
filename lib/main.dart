import 'package:flutter/material.dart';

// data
import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';

import 'package:codi/screens/home_screen.dart';
import 'package:codi/screens/chat_screen.dart';
import 'package:codi/screens/contest_screen.dart';
import 'package:codi/screens/profile_screen.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:codi/data/globals.dart' as globals;

Future<void> main() async {
  await dotenv.load(fileName: 'assets/env/.env');
  globals.backendKey = dotenv.get("backendKey");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(),
      theme: mainTheme,
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const ContestScreen(),
    const ProfileScreen(),
  ];

  List<IconData> navBarIcons = [
    CustomIcons.home,
    CustomIcons.chatbubbles,
    CustomIcons.award_1,
    CustomIcons.profile_1,
  ];

  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: screens.elementAt(_currentIndex),
      ),
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
        color: Theme.of(context).colorScheme.background,
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
                      color: _currentIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
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
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
