import 'package:codi/main.dart';
import 'package:flutter/material.dart';
import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globals.ScreenSize().initSizes(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: globals.ScreenSize.height * 0.175,
            bottom: globals.ScreenSize.height * 0.16,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                'assets/images/background_login.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.1,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "로그인",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.215,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.065,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "이메일 *",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Icon(
                          CustomIcons.message,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.065,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "비밀번호 *",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Icon(
                          CustomIcons.lock,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.0425,
                  child: Text(
                    "계속하기를 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.46,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or Sign In With",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                        thickness: 1,
                        indent: 10,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Image.asset(
                              'assets/images/google.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/face_book.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/kakao_talk.png',
                              width: 32,
                              height: 32,
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
          Positioned(
            bottom: globals.ScreenSize.height * 0.05,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Main(),
                      ),
                    );
                  },
                  child: Container(
                    width: globals.ScreenSize.width * 0.88,
                    height: globals.ScreenSize.height * 0.075,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewAccountScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 14),
                    width: globals.ScreenSize.width * 0.88,
                    height: globals.ScreenSize.height * 0.075,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Text(
                        "새 계정 생성",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: globals.ScreenSize.height * 0.175,
            bottom: globals.ScreenSize.height * 0.16,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Image.asset(
                'assets/images/background_login.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.1,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "계정 생성",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.215,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SizedBox(
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.065,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "이메일 *",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Icon(
                          CustomIcons.message,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.065,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "비밀번호 *",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Icon(
                          CustomIcons.lock,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.065,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "비밀번호 확인 *",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Icon(
                          CustomIcons.lock,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 24,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 22),
                  width: globals.ScreenSize.width * 0.88,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 12,
                          ),
                          Text(
                            "  8~20자",
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 12,
                          ),
                          Text(
                            "  문자, 숫자, 특수문자",
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  width: globals.ScreenSize.width * 0.88,
                  height: globals.ScreenSize.height * 0.0425,
                  child: Text(
                    "아래 다음을 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: globals.ScreenSize.height * 0.635,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                        thickness: 1,
                        indent: 20,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or Sign In With",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                        thickness: 1,
                        indent: 10,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Image.asset(
                              'assets/images/google.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/face_book.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: globals.ScreenSize.width * 0.26,
                          height: globals.ScreenSize.height * 0.065,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/kakao_talk.png',
                              width: 32,
                              height: 32,
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
          Positioned(
            bottom: globals.ScreenSize.height * 0.05,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: globals.ScreenSize.width * 0.88,
                    height: globals.ScreenSize.height * 0.075,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Text(
                        "다음",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 14),
                    width: globals.ScreenSize.width * 0.88,
                    height: globals.ScreenSize.height * 0.075,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
