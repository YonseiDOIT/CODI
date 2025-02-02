import 'package:flutter/material.dart';
import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

import 'package:codi/screens/profile_input_screen.dart';

class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({Key? key}) : super(key: key);

  @override
  State<NewAccountScreen> createState() => _NewAccountScreenState();
}

class _NewAccountScreenState extends State<NewAccountScreen> {
  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

  bool emailValid = true;
  bool showPasswordDifferent = false;
  bool passwordLengthValid = false;
  bool passwordCharValid = false;

  @override
  Widget build(BuildContext context) {
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: globals.ScreenSize.width,
            height: globals.ScreenSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: globals.ScreenSize.topPadding + 46),
                  child: const Text(
                    "계정 생성",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: globals.Colors.point2,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: textFieldDecoration(CustomIcons.message, "이메일 *"),
                      onChanged: (text) {
                        validateEmail(text);
                      },
                      onEditingComplete: () {
                        validateEmail(emailController.text);
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        emailValid ? "" : "올바르지 않는 이메일 형식입니다",
                        style: const TextStyle(
                          color: globals.Colors.point1,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: password1Controller,
                      decoration: textFieldDecoration(CustomIcons.lock, "비밀번호 *"),
                      onChanged: (text) {
                        validatePassword();
                        passwordDifferent();
                      },
                      onEditingComplete: () {
                        validatePassword();
                        passwordDifferent();
                      },
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: TextField(
                        obscureText: true,
                        controller: password2Controller,
                        decoration: textFieldDecoration(CustomIcons.lock, "비밀번호 확인 *"),
                        onChanged: (text) {
                          passwordDifferent();
                        },
                        onEditingComplete: () {
                          passwordDifferent();
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                    Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        showPasswordDifferent ? "비밀번호가 일치하지 않습니다" : "",
                        style: const TextStyle(
                          color: globals.Colors.point1,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              passwordLengthValid ? CustomIcons.tickCircle : CustomIcons.closeCircle,
                              color: globals.Colors.point1,
                              size: 14,
                            ),
                            const Text(
                              "  8~20자",
                              style: TextStyle(
                                fontSize: 12,
                                color: globals.Colors.point2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              passwordCharValid ? CustomIcons.tickCircle : CustomIcons.closeCircle,
                              color: globals.Colors.point1,
                              size: 14,
                            ),
                            const Text(
                              "  문자, 숫자, 특수문자",
                              style: TextStyle(
                                fontSize: 12,
                                color: globals.Colors.point2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 28, bottom: 18),
                      child: const Text(
                        "아래 다음을 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: globals.Colors.sub2,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: globals.Colors.sub2,
                            thickness: 1,
                            indent: 20,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "Or Sign In With",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: globals.Colors.point2,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: globals.Colors.sub2,
                            thickness: 1,
                            indent: 10,
                            endIndent: 20,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 19,
                        bottom: 28,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 31,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: globals.Colors.sub3,
                                border: Border.all(
                                  color: globals.Colors.sub2,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Image.asset(
                                'assets/images/google.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 31,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: globals.Colors.sub3,
                                border: Border.all(
                                  color: globals.Colors.sub2,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Image.asset(
                                'assets/images/face_book.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 31,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: globals.Colors.sub3,
                                border: Border.all(
                                  color: globals.Colors.sub2,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Image.asset(
                                'assets/images/kakao_talk.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfileInputScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: globals.Colors.point1,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            "다음",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: globals.Colors.sub3,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: globals.Colors.sub3,
                          border: Border.all(
                            color: globals.Colors.point1,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            "이전",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: globals.Colors.point1,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration textFieldDecoration(IconData prefixIcon, String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: globals.Colors.sub3,
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: globals.Colors.sub2,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 22, right: 12),
        child: Icon(
          prefixIcon,
          color: globals.Colors.sub2,
          size: 24,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: globals.Colors.sub2,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: globals.Colors.point2,
          width: 1.5,
        ),
      ),
    );
  }

  void validateEmail(String email) {
    setState(() {
      if (email.isEmpty) {
        emailValid = true;
        return;
      }
      emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    });
  }

  void validatePassword() {
    // Regular expressions for different character types
    final hasNumber = RegExp(r'\d').hasMatch(password1Controller.text); // Matches at least one digit
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password1Controller.text); // Matches at least one letter
    final hasSpecial = RegExp(r'[!@#\$%^&*()_+\-=\[\]{};:]').hasMatch(password1Controller.text); // Matches special characters

    setState(() {
      passwordLengthValid = password1Controller.text.length >= 8 && password1Controller.text.length <= 20;
      passwordCharValid = hasNumber && hasLetter && hasSpecial;
    });
  }

  void passwordDifferent() {
    setState(() {
      showPasswordDifferent = password1Controller.text != password2Controller.text;
    });
  }
}
