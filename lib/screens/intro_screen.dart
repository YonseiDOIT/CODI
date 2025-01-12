import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/screens/login_screen.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:codi/data/globals.dart' as globals;

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
              left: globals.ScreenSize.width * 0.6,
              top: -globals.ScreenSize.height * 0.0625,
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
              top: globals.ScreenSize.height * 0.625,
              left: -globals.ScreenSize.width * 0.47,
              child: Container(
                width: 333,
                height: 376,
                decoration: ShapeDecoration(
                  color: globals.Colors.sub3.withOpacity(0.6),
                  shape: const OvalBorder(),
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
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/background_splash.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    width: 65,
                    height: 36,
                    // top: 66,
                    top: globals.ScreenSize.height * 0.0825,
                    left: 20,
                    child: Hero(
                      tag: "logo",
                      child: Image.asset('assets/icon/logo.png'),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    // top: 180,
                    top: globals.ScreenSize.height * 0.225,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1200),
                      opacity: animated ? 1 : 0,
                      child: Text(
                        'Code your\ndesign,\ndesign your\ncode:',
                        style: TextStyle(
                          color: globals.Colors.sub3,
                          fontSize: 48,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    // top: 420,
                    top: globals.ScreenSize.height * 0.525,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1200),
                      opacity: animated ? 1 : 0,
                      child: Text(
                        '개발자와 디자이너를 위한 최초의 팀빌딩\n서비스 CODI',
                        style: TextStyle(
                          color: globals.Colors.sub3.withOpacity(0.7),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 1200),
                          opacity: animated ? 1 : 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 328,
                              height: 54,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 15),
                              decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  width: 2,
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.0, 0.5),
                                    end: Alignment(-0.9, 2.5),
                                    colors: [
                                      Color(0xB1FFFFFF),
                                      Color(0x33A18AF6)
                                    ],
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(45),
                                color: globals.Colors.sub3.withOpacity(0.2),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '시작하기',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: globals.Colors.sub3,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 1.40,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Icon(
                                      CustomIcons.right,
                                      color: globals.Colors.sub3,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => animated = true);
    // await Future.delayed(Duration(milliseconds: 3000));
  }
}
