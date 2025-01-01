import 'package:flutter/material.dart';
import 'package:codi/data/custom_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 82),
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
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "계정을 입력하거나 소셜 계정으로 로그인 하세요",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 44),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Email *",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Icon(
                      CustomIcons.message,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password*",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Icon(
                      CustomIcons.lock,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              width: 302,
              height: 34,
              child: Text(
                "계속하기를 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 38),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      thickness: 1,
                      indent: 20,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Sign In With",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      thickness: 1,
                      indent: 10,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17),
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17),
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/kakao_talk.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 154),
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: GestureDetector(
                  onTap: () {
                    //누르면 실행될 동작
                  },
                  child: Center(
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewAccountScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      "새 계정 생성",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 82),
              alignment: Alignment.center,
              child: Text(
                "계정 생성",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onBackground, fontSize: 20, fontFamily: 'Pretendard-Bold'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "아래 정보를 입력하시거나 소셜 계정으로 등록하세요",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onBackground, fontSize: 14, fontFamily: 'Pretendard-Bold'),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 44),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your name*",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Image.asset(
                      'assets/images/Email.png',
                      width: 24,
                      height: 24,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Email*",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Image.asset(
                      'assets/images/Password.png',
                      width: 24,
                      height: 24,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password*",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Image.asset(
                      'assets/images/Password.png',
                      width: 24,
                      height: 24,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Confirm Password **",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 12),
                    child: Image.asset(
                      'assets/images/Password.png',
                      width: 24,
                      height: 24,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              width: 302,
              height: 34,
              child: Text(
                "계속하기를 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                    fontSize: 12,
                    fontFamily: 'Pretendard-Light'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 38),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      thickness: 1,
                      indent: 20,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "Or Sign In With",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                      thickness: 1,
                      indent: 10,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/google.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17),
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17),
                    width: 95,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //누르면 실행될 동작
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Image.asset(
                              'assets/images/kakao_talk.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 22),
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: GestureDetector(
                  onTap: () {
                    //누르면 실행될 동작
                  },
                  child: Center(
                    child: Text(
                      "새 계정 생성",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: GestureDetector(
                  onTap: () {
                    //누르면 실행될 동작
                  },
                  child: Center(
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
