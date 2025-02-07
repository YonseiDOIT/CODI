// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'package:http_parser/http_parser.dart';
import 'package:codi/models/models.dart' as models;

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

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
    var response = await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    // print("decodeResponse : ${decodedResponse}");
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

    var uri = Uri.https("api.0john-hong0.com", "/codi/users/by-id", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }

  static Future<Map<String, dynamic>> updateUser({
    required int user_id,
    String? username,
    String? email,
    String? position,
    int? gender,
    int? selected_title_id,
    File? profile_picture,
  }) async {
    var uri = Uri.https("api.0john-hong0.com", "/codi/users/$user_id");
    var request = http.MultipartRequest("PUT", uri);

    // Add form fields
    request.fields.addAll({
      if (username != null) "username": username,
      if (email != null) "email": email,
      if (position != null) "position": position,
      if (gender != null) "gender": gender.toString(),
      if (selected_title_id != null) "selected_title_id": selected_title_id.toString(),
    });

    // print(request.fields);

    // Attach profile picture if provided
    if (profile_picture != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          "profile_picture", profile_picture.path,
          // contentType: MediaType("image", "jpeg"), // Adjust if using PNG
        ),
      );
    }

    Map<String, String> customHeaders = Map.from(_headers);
    customHeaders.remove("Content-Type"); // Remove application/json
    customHeaders["Content-Type"] = "multipart/form-data"; // Set correct content type

    request.headers.addAll(customHeaders); // Add updated headers

    // Send request
    var response = await request.send();

    var decodedResponse = jsonDecode(await response.stream.bytesToString());
    return decodedResponse;
  }

  static Future<Map<String, dynamic>> userLogin({
    required String email,
    required String password,
  }) async {
    Map<String, String> queryParameters = {
      'email': email,
      'password': password,
    };

    var uri = Uri.https("api.0john-hong0.com", "/codi/users/login", queryParameters);
    var response = await http.get(uri, headers: _headers);

    if (response.statusCode == 404) {
      throw Exception("User not found (404)");
    }

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
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

    var uri = Uri.https("api.0john-hong0.com", "/codi/contests", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.Contest> contests = decodedResponse.map<models.Contest>((contest) => models.Contest.fromJson(contest)).toList();
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

    var uri = Uri.https("api.0john-hong0.com", "/codi/recruits", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.TeamRecruitmentPost> posts =
        decodedResponse.map<models.TeamRecruitmentPost>((post) => models.TeamRecruitmentPost.fromJson(post)).toList();
    return posts;
  }

  static Future<List<models.TeamRecruitmentPost>> getPostsByContest({
    required int contest_id,
  }) async {
    var uri = Uri.https("api.0john-hong0.com", "/codi/contests/$contest_id/recruits");
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.TeamRecruitmentPost> posts =
        decodedResponse.map<models.TeamRecruitmentPost>((post) => models.TeamRecruitmentPost.fromJson(post)).toList();
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
    var response = await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }
}

class Post {
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

    var uri = Uri.https("api.0john-hong0.com", "/codi/posts", queryParameters);
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<models.Post> contests = decodedResponse.map<models.Post>((contest) => models.Post.fromJson(contest)).toList();
    return contests;
  }
}

class Chat {
//   globals.socket socket;

  static void connectToWebSocket(int user_id) {
    globals.channel = WebSocketChannel.connect(
      Uri.parse('ws://api.0john-hong0.com/codi/ws/$user_id'),
    );

    // globals.channel.stream.listen(
    //   (message) {
    //     print("Received: $message");
    //   },
    //   onDone: () {
    //     print("WebSocket closed");
    //   },
    //   onError: (error) {
    //     print("Error: $error");
    //   },
    // );
  }
//   static socket_io.Socket? socket;

//   static void connectToSocket(String userId) {
// 	socket_io.OptionBuilder().setPath('/codi/ws/1');
//     socket = socket_io.io('https://api.0john-hong0.com', <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//       'query': {'userId': userId},
//     });

//     socket?.on('connect', (_) {
//       print('Connected to socket server');
//     });

//     socket?.on('disconnect', (_) {
//       print('Disconnected from socket server');
//     });

//     socket?.on('error', (data) {
//       print('Socket error: $data');
//     });

//     socket?.connect();
//   }

//   static void disconnectSocket() {
//     socket?.disconnect();
//   }

  static Future<List<dynamic>> getChatRooms({
    required int userId,
  }) async {
    var uri = Uri.http("api.0john-hong0.com", "/codi/chats/$userId");
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return decodedResponse;
  }

  static Future<Map<String, dynamic>> makeChatRoom({
    required int userId,
    required String roomName,
    required List<int> memberIds,
    DateTime? createdAt,
  }) async {
    Map<String, dynamic> body = {
      "chat_room": {
        "room_name": roomName,
        "message_count": 0,
        "created_at": createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      },
      "member_ids": memberIds,
    };

    var uri = Uri.http("api.0john-hong0.com", "/codi/chats/make-room/$userId");
    var response = await http.post(uri, headers: _headers, body: jsonEncode(body));

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return decodedResponse;
  }

  static Future<List<dynamic>> getMessages({
    required int roomId,
  }) async {
    var uri = Uri.http("api.0john-hong0.com", "/codi/chats/$roomId/messages");
    var response = await http.get(uri, headers: _headers);

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return decodedResponse;
  }
}
