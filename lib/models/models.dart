// ignore_for_file: non_constant_identifier_names
library models;

import 'package:codi/data/globals.dart' as globals;

class User {
  int user_id;
  String username;
  String? password;
  String? email;

  // Social login
  String? social_type;
  String? kakao_id;
  String? facebook_id;

  String? nickname;
  String position;
  String? profile_picture;
  int gender;
  String? career;
  String? portfolio_link;
  DateTime? created_at;
  DateTime? deleted_at;
  int? participation_score;
  int? participation_id;
  int? skill_score;
  int? skill_id;
  int? selected_title_id;
  Title? selected_title;
  List<Title>? titles;

  User({
    required this.user_id,
    required this.username,
    this.password,
    this.email,
    this.social_type,
    this.kakao_id,
    this.facebook_id,
    this.nickname,
    required this.position,
    this.profile_picture,
    required this.gender,
    this.career,
    this.portfolio_link,
    this.created_at,
    this.deleted_at,
    this.participation_score,
    this.participation_id,
    this.skill_score,
    this.skill_id,
    this.selected_title_id,
    this.selected_title,
    this.titles,
  });

  Map ToMap() {
    Map<String, dynamic> data = {
      "user_id": user_id,
      "username": username,
      "email": email,
      "social_type": social_type,
      "kakao_id": kakao_id,
      "facebook_id": facebook_id,
      "nickname": nickname,
      "position": position,
      "profile_picture": profile_picture,
      "career": career,
      "portfolio_link": portfolio_link,
      "created_at": created_at,
      "deleted_at": deleted_at,
      "participation_score": participation_score,
      "participation_id": participation_id,
      "skill_score": skill_score,
      "skill_id": skill_id,
    };

    return data;
  }

  static User FromJson(Map<String, dynamic> data) {
    List<Title> titles = [];

    titles.addAll(globals.defaultTitles);

    // for (var defaultTitle in globals.defaultTitles) {
    //   // titles.add(
    //   //   Title.fromJson({
    //   //     ...defaultTitle.toMap(),
    //   //     "count": data["titles"]?.firstWhere(
    //   //           (title) => title["title_id"] == defaultTitle.title_id,
    //   //           orElse: () => {"count": 0},
    //   //         )["count"] ??
    //   //         0,
    //   //   }),
    //   // );
    // }
    data["titles"]?.forEach(
      (ownedTitle) {
        // Find the title in the user's titles list by matching the title_id
        Title? userTitle = titles.firstWhere(
          (title) => title.title_id == ownedTitle["title_id"],
        );

        // If a matching title is found, update its count
        if (userTitle != null) {
          userTitle.count = ownedTitle["count"];
        }
      },
    );

    return User(
      user_id: data["user_id"],
      username: data["username"],
      // password: data["password"],
      email: data["email"],
      social_type: data["social_type"],
      kakao_id: data["kakao_id"],
      facebook_id: data["facebook_id"],
      nickname: data["nickname"],
      position: data["position"],
      profile_picture: data["profile_picture"],
      gender: data["gender"],
      career: data["career"],
      portfolio_link: data["portfolio_link"],
      created_at: data["created_at"] != null ? DateTime.parse(data["created_at"]) : null,
      deleted_at: data["deleted_at"] != null ? DateTime.parse(data["deleted_at"]) : null,
      participation_score: data["participation_score"],
      participation_id: data["participation_id"],
      skill_score: data["skill_score"],
      skill_id: data["skill_id"],
      titles: titles.isNotEmpty ? titles : null,
      selected_title_id: data["selected_title_id"],
      selected_title: data["selected_title"] != null ? Title.fromJson(data["selected_title"]) : null,
    );
  }
}

class Contest {
  int contest_id;
  int uploader_id;
  String? name;
  String? poster_image_link;
  String? tags;
  String? entry_requirements;
  String? hosting_organization;
  DateTime? registration_start_date;
  DateTime? registration_end_date;
  String? prizes;
  String? application_method;
  String? details;
  int interest_count;
  int view_count;
  DateTime? created_at;
  DateTime? deleted_at;
  String state;

  Contest({
    required this.contest_id,
    required this.uploader_id,
    this.name,
    this.poster_image_link,
    this.tags,
    this.entry_requirements,
    this.hosting_organization,
    this.registration_start_date,
    this.registration_end_date,
    this.prizes,
    this.application_method,
    this.details,
    this.interest_count = 0,
    this.view_count = 0,
    this.created_at,
    this.deleted_at,
    this.state = 'pending',
  });

  static fromJson(item) {
    return Contest(
      contest_id: item['contest_id'],
      uploader_id: item['uploader_id'],
      name: item['name'],
      poster_image_link: item['poster_image_link'],
      tags: item['tags'],
      entry_requirements: item['entry_requirements'],
      hosting_organization: item['hosting_organization'],
      registration_start_date: item['registration_start_date'] != null ? DateTime.parse(item['registration_start_date']) : null,
      registration_end_date: item['registration_end_date'] != null ? DateTime.parse(item['registration_end_date']) : null,
      prizes: item['prizes'],
      application_method: item['application_method'],
      details: item['details'],
      interest_count: item['interest_count'],
      view_count: item['view_count'],
      created_at: item['created_at'] != null ? DateTime.parse(item['created_at']) : null,
      deleted_at: item['deleted_at'] != null ? DateTime.parse(item['deleted_at']) : null,
      state: item['state'],
    );
  }
}

class Team {
  int team_id;
  int? contest_id;
  Contest? contest;
  //
  int? post_id;
  String? name;
  String? description;
  DateTime? created_at;

  Team({
    required this.team_id,
    this.contest_id,
    this.contest,
    this.post_id,
    this.name,
    this.description,
    this.created_at,
  });
}

class TeamMember {
  int member_id;
  int user_id;
  User user;
  int team_id;
  String? role;
  String state;
  DateTime? join_date;

  TeamMember({
    required this.member_id,
    required this.user_id,
    required this.team_id,
    required this.user,
    this.role,
    this.state = 'pending',
    this.join_date,
  });
}

class TeamRecruitmentPost {
  int recruitment_post_id;
  int team_id;
  int contest_id;
  Contest? contest;
  String title;
  String description;
  DateTime? created_at;
  DateTime? end_at;
  int max_members;
  bool is_open = true;
  List<TeamMember> members;

  TeamRecruitmentPost({
    required this.recruitment_post_id,
    required this.team_id,
    required this.contest_id,
    required this.contest,
    required this.title,
    required this.description,
    this.created_at,
    this.end_at,
    required this.max_members,
    this.is_open = true,
    required this.members,
  });

  static fromJson(post) {
    return TeamRecruitmentPost(
      recruitment_post_id: post['recruitment_post_id'],
      team_id: post['team_id'],
      contest_id: post['contest_id'],
      contest: post['contest'] != null
          ? Contest(
              contest_id: post['contest']['contest_id'],
              uploader_id: post['contest']['uploader_id'],
              name: post['contest']['name'],
              poster_image_link: post['contest']['poster_image_link'],
              tags: post['contest']['tags'],
              entry_requirements: post['contest']['entry_requirements'],
              hosting_organization: post['contest']['hosting_organization'],
              registration_start_date:
                  post['contest']['registration_start_date'] != null ? DateTime.parse(post['contest']['registration_start_date']) : null,
              registration_end_date:
                  post['contest']['registration_end_date'] != null ? DateTime.parse(post['contest']['registration_end_date']) : null,
              prizes: post['contest']['prizes'],
              application_method: post['contest']['application_method'],
              details: post['contest']['details'],
              interest_count: post['contest']['interest_count'],
              view_count: post['contest']['view_count'],
              created_at: post['contest']['created_at'] != null ? DateTime.parse(post['contest']['created_at']) : null,
              deleted_at: post['contest']['deleted_at'] != null ? DateTime.parse(post['contest']['deleted_at']) : null,
              state: post['contest']['state'],
            )
          : null,
      title: post['title'],
      description: post['description'],
      created_at: post['created_at'] != null ? DateTime.parse(post['created_at']) : null,
      end_at: post['end_at'] != null ? DateTime.parse(post['end_at']) : null,
      is_open: post['is_open'],
      max_members: post['max_members'],
      members: (post['members'] as List)
          .map(
            (member) => TeamMember(
              member_id: member['member_id'],
              user_id: member['user_id'],
              team_id: member['team_id'],
              user: User(
                user_id: member['user']['user_id'],
                username: member['user']['username'],
                email: member['user']['email'],
                social_type: member['user']['social_type'],
                kakao_id: member['user']['kakao_id'],
                facebook_id: member['user']['facebook_id'],
                nickname: member['user']['nickname'],
                position: member['user']['position'],
                profile_picture: member['user']['profile_picture'],
                gender: member['user']["gender"],
                career: member['user']['career'],
                portfolio_link: member['user']['portfolio_link'],
                created_at: member['user']['created_at'] != null ? DateTime.parse(member['user']['created_at']) : null,
                deleted_at: member['user']['deleted_at'] != null ? DateTime.parse(member['user']['deleted_at']) : null,
                participation_score: member['user']['participation_score'],
                participation_id: member['user']['participation_id'],
                skill_score: member['user']['skill_score'],
                skill_id: member['user']['skill_id'],
              ),
              role: member['role'],
              state: member['state'],
              join_date: member['join_date'] != null ? DateTime.parse(member['join_date']) : null,
            ),
          )
          .toList(),
    );
  }
}

class Title {
  int title_id;

  String title;
  String image_name;
  String type;
  int count;

  Title({
    required this.title_id,
    required this.title,
    required this.image_name,
    required this.type,
    required this.count,
  });

  static Title fromJson(Map<String, dynamic> json) {
    return Title(
      title_id: json['title_id'],
      title: json['title'],
      image_name: json['image_name'],
      type: json['type'],
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title_id': title_id,
      'title': title,
      'image_name': image_name,
      'type': type,
      'count': count,
    };
  }
}

class ChatRoom {
  int chatroom_id;
  String name;
  int message_count;
  DateTime? created_at;
  DateTime? deleted_at;
  List<ChatMessage> messages;

  ChatRoom({
    required this.chatroom_id,
    required this.name,
    this.message_count = 0,
    this.created_at,
    this.deleted_at,
    required this.messages,
  });

  static ChatRoom FromJson(Map<String, dynamic> json) {
    return ChatRoom(
      chatroom_id: json['chatroom_id'],
      name: json['name'],
      message_count: json['message_count'],
      created_at: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      deleted_at: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      messages: (json['messages'] as List).map((message) => ChatMessage.FromJson(message)).toList(),
    );
  }

  Map<String, dynamic> ToMap() {
    return {
      'chatroom_id': chatroom_id,
      'name': name,
      'message_count': message_count,
      'created_at': created_at?.toIso8601String(),
      'deleted_at': deleted_at?.toIso8601String(),
      'messages': messages.map((message) => message.toMap()).toList(),
    };
  }
}

class ChatMessage {
  int message_id;
  int user_id;
  User user;
  int room_id;
  String? content;
  DateTime? sent_at;

  ChatMessage({
    required this.message_id,
    required this.user_id,
    required this.room_id,
    required this.user,
    this.content,
    this.sent_at,
  });

  static ChatMessage FromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message_id: json['message_id'],
      user_id: json['user_id'],
      room_id: json['room_id'],
      user: User.FromJson(json['user']),
      content: json['content'],
      sent_at: json['sent_at'] != null ? DateTime.parse(json['sent_at']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message_id': message_id,
      'user_id': user_id,
      'user': user.ToMap(),
      'room_id': room_id,
      'content': content,
      'sent_at': sent_at?.toIso8601String(),
    };
  }
}
