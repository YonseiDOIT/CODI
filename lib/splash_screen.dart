import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:codi/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animated = false;

  @override
  void initState() {
    startAnimation();
  }

  Widget build(BuildContext context) {
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
              left: 250,
              top: -50,
              child: Container(
                width: 450,
                height: 514,
                decoration: const ShapeDecoration(
                  color: Color(0xFF8C92FF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: -172,
              top: 500,
              child: Container(
                width: 333,
                height: 376,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: const OvalBorder(),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
              child: Center(
                child: AnimatedOpacity(
                    opacity: animated ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: SizedBox(
                        width: 109,
                        height: 60,
                        child: Image.asset('assets/icon/logo.png'))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() => animated = true);
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IntroScreen()));
  }
}
