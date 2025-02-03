import 'package:codi/screens/profile_input_screen.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';

// API
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

import 'package:codi/main.dart';
import 'package:codi/screens/login_screen.dart';
import 'package:codi/screens/new_account_screen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    "로그인",
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: globals.Colors.sub3,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                        hintText: "이메일 *",
                        hintStyle: const TextStyle(
                          color: globals.Colors.sub2,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 22, right: 12),
                          child: Icon(
                            CustomIcons.message,
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
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: globals.Colors.sub3,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                          hintText: "비밀번호 *",
                          hintStyle: const TextStyle(
                            color: globals.Colors.sub2,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 22, right: 12),
                            child: Icon(
                              CustomIcons.lock,
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
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 28, bottom: 18),
                      child: const Text(
                        "계속하기를 클릭하면 이용 약관과 개인정보 처리방침에 동의하게 됩니다.",
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
                        bottom: 166,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
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
                            onTap: () async {
                              debugPrint("카카오 로그인");

                              loginWithKakao(context);
                              if (!globals.isLoggedIn) {}

                              // new의 값이 true면 프로필 입력 화면으로 이동
                              // false 면 홈화면으로 이동
                            },
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
                        loginWithEmail();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: globals.Colors.point1,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            "로그인",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewAccountScreen(),
                          ),
                        );
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
                            "새 계정 생성",
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
          )
        ],
      ),
    );
  }

  void loginWithKakao(BuildContext context) async {
    OAuthToken token;
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        debugPrint('카카오톡으로 로그인 성공 ${token.accessToken}');
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');

        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          debugPrint('카카오계정으로 로그인 성공 ${token.accessToken}');
        } catch (error) {
          debugPrint('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오계정으로 로그인 성공 ${token.accessToken}');
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
      }
    }

    try {
      User user = await UserApi.instance.me();
      debugPrint("$user");
      try {
        Map userApiData;

        userApiData = await api.User.addUser(
          // profile_picture: user.kakaoAccount!.profile!.thumbnailImageUrl ??
          //     "https://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R110x110",
          // username: user.kakaoAccount!.profile!.nickname!,
          username: "${user.kakaoAccount!.profile!.nickname!}${(user.id).toString().substring(0, 4)}",
          social_type: "kakao",
          kakao_id: "${user.id}",
          // nickname:
          //     "${user.kakaoAccount!.profile!.nickname!}${(user.id).toString().substring(0, 2)}$temp",
        );
        print("userApiData: $userApiData");

        globals.codiUser = models.User.FromJson(userApiData["User"]);
        // globals.isLoggedIn = true;

        // !bool.parse(userApiData["acknowledged"], caseSensitive: false));

        try {
          await globals.localData.saveMap("codi_user", globals.codiUser.ToMap());
          globals.isLoggedIn = true;
        } catch (error) {
          debugPrint('로컬 저장 실패 $error');
        }

        if (globals.isLoggedIn) {
          if (userApiData["new"]) {
            _toProfileInput();
          } else {
            _toMain();
          }
        } else {
          // TODO: show error message.
        }
      } catch (error) {
        debugPrint('백엔드 오류 $error');
      }
    } catch (error) {
      debugPrint('사용자 정보 요청 실패 $error');
    }
  }

  Future<void> loginWithEmail() async {
    try {
      Map userApiData = await api.User.userLogin(email: emailController.text, password: passwordController.text);

      try {
        globals.codiUser = models.User.FromJson(userApiData.cast<String, dynamic>());
        await globals.localData.saveMap("codi_user", globals.codiUser.ToMap());
        globals.isLoggedIn = true;
      } catch (error) {
        debugPrint('로컬 저장 실패 $error');
      }
    } catch (error) {
      debugPrint('이메일로 로그인 실패 $error');
    }
  }

  void _toMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Main(),
      ),
    );
  }

  void _toProfileInput() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileInputScreen(),
      ),
    );
  }
}
