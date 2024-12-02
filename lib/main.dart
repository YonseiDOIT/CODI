import 'package:flutter/material.dart';

// data
import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/size_config.dart';

void main() {
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

  double animatedPositionedLeftValue(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Appsizes.blockSizeHorizontal * 14.0;
      case 1:
        return Appsizes.blockSizeHorizontal * 36.5;
      case 2:
        return Appsizes.blockSizeHorizontal * 59.5;
      case 3:
        return Appsizes.blockSizeHorizontal * 82.0;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Appsizes().initSizes(context);
    return Scaffold(
      body: Placeholder(),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Positioned _buildBottomNavBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: Appsizes.screenWidth,
        height: Appsizes.screenHeight * 0.1,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: Appsizes.blockSizeHorizontal * 3,
              right: Appsizes.blockSizeVertical * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomNavButtons(
                    icon: CustomIcons.home,
                    currentIndex: _currentIndex,
                    index: 0,
                    onPressed: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                  ),
                  BottomNavButtons(
                    icon: CustomIcons.chatbubbles,
                    currentIndex: _currentIndex,
                    index: 1,
                    onPressed: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                  ),
                  BottomNavButtons(
                    icon: CustomIcons.award_1,
                    currentIndex: _currentIndex,
                    index: 2,
                    onPressed: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                  ),
                  BottomNavButtons(
                    icon: CustomIcons.profile_1,
                    currentIndex: _currentIndex,
                    index: 3,
                    onPressed: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              left: animatedPositionedLeftValue(_currentIndex),
              bottom: 25,
              child: Container(
                height: Appsizes.blockSizeHorizontal * 1.0,
                width: Appsizes.blockSizeVertical * 0.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavButtons extends StatelessWidget {
  const BottomNavButtons({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
  });

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: SizedBox(
        height: Appsizes.blockSizeVertical * 5,
        width: Appsizes.blockSizeHorizontal * 6,
        child: Stack(
          children: [
            Icon(
              icon,
              color: currentIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              size: Appsizes.blockSizeHorizontal * 6,
            ),
          ],
        ),
      ),
    );
  }
}
