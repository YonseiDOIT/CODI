import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:codi/screens/intro_screen.dart';
import 'package:codi/screens/login_screen.dart';
import 'package:codi/main.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animated = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);
    return Scaffold(
      body: AnimatedContainer(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.00, -1.00),
            end: const Alignment(0, 1),
            colors: animated
                ? [
                    const Color(0xFF6923FE),
                    const Color(0xFF876EF1),
                  ]
                : [
                    const Color(0xff826CF9),
                    const Color(0xff826CF9),
                  ],
          ),
          // color: Color(0xff826CF9),
        ),
        duration: const Duration(milliseconds: 500),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: globals.ScreenSize.width * 0.6,
              top: -globals.ScreenSize.height * 0.0625,
              child: AnimatedOpacity(
                opacity: animated ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 450,
                  height: 514,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF8C92FF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: globals.ScreenSize.height * 0.625,
              left: -globals.ScreenSize.width * 0.47,
              child: AnimatedOpacity(
                opacity: animated ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 333,
                  height: 376,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: const OvalBorder(),
                  ),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
              child: Stack(
                children: [
                  Positioned(
                    top: globals.ScreenSize.height * 0.175,
                    bottom: globals.ScreenSize.height * 0.16,
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      opacity: animated ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/background_splash.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: AnimatedOpacity(
                      opacity: animated ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: SizedBox(
                        width: 109,
                        height: 60,
                        child: Hero(
                          tag: "logo",
                          child: Image.asset('assets/icon/logo.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => animated = true);
    await Future.delayed(const Duration(milliseconds: 3000));

    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      // Attempt to get user data from local storage
      Map<String, dynamic> userData = await globals.localData.getMap("user") ?? {};

      userData = await api.User.getUser(user_id: 1);
      print(userData);

      if (userData.isNotEmpty) {
        // User is logged in
        globals.codiUser = models.User.FromJson(userData); // Assign to global user
        globals.isLoggedIn = true;

        // Navigate to the main screen
        _toMain();
      } else {
        // User is not logged in
        globals.isLoggedIn = false;

        // Navigate to the Intro screen
        _toIntro();
      }
    } catch (e) {
      print("Error checking login status: $e");

      // Navigate to Intro on error
      _toIntro();
    }
  }

  void _toMain() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const Main(),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation1, animation2, child) {
          return FadeTransition(
            opacity: animation1,
            child: child,
          );
        },
      ),
    );
  }

  void _toIntro() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const IntroScreen(),
        transitionDuration: const Duration(milliseconds: 1800),
      ),
    );
  }
}
