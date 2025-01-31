// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

Map<String, String> _headers = {
  'accept': 'application/json',
  'Content-Type': 'application/json',
  'api-key': globals.backendKey,
};

class User {
  static Future<Map<String, dynamic>> addUser({
    String? username,
    String? password,
    String? email,
    String? social_type,
    String? kakao_id,
    String? facebook_id,
    String? nickname,
    String? position,
    String? profile_picture,
    String? career,
    String? portfolio_link,
  }) async {
    Map<String, dynamic> body = {
      "username": username,
      "password": password,
      "email": email,
      "social_type": social_type,
      "kakao_id": kakao_id,
      "facebook_id": facebook_id,
      "nickname": nickname,
      "position": position,
      "profile_picture": profile_picture,
      "career": career,
      "portfolio_link": portfolio_link,
    };

    var uri = Uri.https("api.0john-hong0.com", "/codi/users");
    var response =
        await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    print("decodeResponse : ${decodedResponse}");
    return decodedResponse;
  }

  static Future<Map<String, dynamic>> getUser({
    int? user_id,
    String? kakao_id,
  }) async {
    Map<String, String> queryParameters = {
      if (user_id != null) 'user_id': user_id.toString(),
      if (kakao_id != null) 'kakao_id': kakao_id,
    };

    var uri =
        Uri.https("api.0john-hong0.com", "/codi/users/by-id", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }
}

class Contest {
  static Future<List<dynamic>> getContests({
    String? keyword,
    String sort = "recent",
    int limit = 20,
    int offset = 0,
  }) async {
    Map<String, String> queryParameters = {
      if (keyword != null) 'keyword': keyword,
      'sort': sort,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    var uri =
        Uri.https("api.0john-hong0.com", "/codi/contests", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.Contest> contests = decodedResponse
        .map<models.Contest>((contest) => models.Contest.fromJson(contest))
        .toList();
    return contests;
  }
}

class RecruitmentPost {
  static Future<List<dynamic>> getPosts({
    String? keyword,
    String sort = "recent",
    int limit = 20,
    int offset = 0,
  }) async {
    Map<String, String> queryParameters = {
      if (keyword != null) 'keyword': keyword,
      'sort': sort,
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    var uri =
        Uri.https("api.0john-hong0.com", "/codi/recruits", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.TeamRecruitmentPost> posts = decodedResponse
        .map<models.TeamRecruitmentPost>(
            (post) => models.TeamRecruitmentPost.fromJson(post))
        .toList();
    return posts;
  }

  static Future<List<models.TeamRecruitmentPost>> getPostsByContest({
    required int contest_id,
  }) async {
    var uri =
        Uri.https("api.0john-hong0.com", "/codi/contests/$contest_id/recruits");
    var response = await http.get(uri, headers: _headers);

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.TeamRecruitmentPost> posts = decodedResponse
        .map<models.TeamRecruitmentPost>(
            (post) => models.TeamRecruitmentPost.fromJson(post))
        .toList();
    return posts;
  }

  static Future<Map<String, dynamic>> addPost({
    required int contest_id,
    required int user_id,
    required String title,
    required String description,
    int max_members = 4,
    DateTime? end_at,
  }) async {
    Map<String, dynamic> body = {
      "contest_id": contest_id,
      "user_id": user_id,
      "title": title,
      "description": description,
      if (end_at != null) "end_at": end_at,
    };

    var uri = Uri.https("api.0john-hong0.com", "/codi/recruits");
    var response =
        await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }
}
