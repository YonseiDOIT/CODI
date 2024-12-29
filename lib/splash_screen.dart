import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:codi/intro_screen.dart';

import 'package:codi/data/globals.dart' as globals;

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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF6923FE), Color(0xFF876EF1)],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              // left: 250,
              // top: -50,
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
              // left: -172,
              // top: 500,
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
              child: Center(
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
    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(
      //   builder: (context) => IntroScreen(),
      // ),
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const IntroScreen(),
        // transitionDuration: Duration.zero,
        transitionDuration: const Duration(milliseconds: 1800),
        // reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
