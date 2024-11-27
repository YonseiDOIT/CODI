// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:app/globals.dart' as globals;

Map<String, String> _headers = {
  'accept': 'application/json',
  'Content-Type': 'application/json',
};

class User {
  static Future<Map<String, dynamic>> addUser({
    String? kakao_id,
    String? student_number,
    String? department,
    int? grade,
    String? name,
    String? Position,
    String? nickname,
    String? profile_picture,
    String? career,
    String? portfolio_link,
  }) async {
    Map<String, dynamic> body = {
      "kakao_id": kakao_id,
      "student_number": student_number,
      "department": department,
      "grade": grade,
      "name": name,
      "position": Position,
      "nickname": nickname,
      "profile_picture": profile_picture,
      "career": career,
      "portfolio_link": portfolio_link,
    };

    var uri = Uri.https("api.0john-hong0.com", "/codi/users");
    var response = await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }

  static Future<Map<String, dynamic>> getUser({
    int? user_id,
    String? kakao_id,
  }) async {
    Map<String, dynamic> queryParameters = {
      "user_id": user_id,
      "kakao_id": kakao_id,
    };

    var uri = Uri.https("api.0john-hong0.com", "/codi/users", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }
}
