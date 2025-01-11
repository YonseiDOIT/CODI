// ignore_for_file: non_constant_identifier_names

class User {
  int user_id;
  String username;
  String? password;
  String email;

  // Social login
  String? social_type;
  String? kakao_id;
  String? facebook_id;

  String? nickname;
  String? position;
  String? profile_picture;
  String? career;
  String? portfolio_link;
  DateTime? created_at;
  DateTime? deleted_at;
  int? participation_score;
  int? participation_id;
  int? skill_score;
  int? skill_id;

  User({
    required this.user_id,
    required this.username,
    this.password,
    required this.email,
    this.social_type,
    this.kakao_id,
    this.facebook_id,
    this.nickname,
    this.position,
    this.profile_picture,
    this.career,
    this.portfolio_link,
    this.created_at,
    this.deleted_at,
    this.participation_score,
    this.participation_id,
    this.skill_score,
    this.skill_id,
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

  void FromMap(Map<String, dynamic> data) {
    user_id = data["user_id"];
    username = data["username"];
    email = data["email"];
    social_type = data["social_type"];
    kakao_id = data["kakao_id"];
    facebook_id = data["facebook_id"];
    nickname = data["nickname"];
    position = data["position"];
    profile_picture = data["profile_picture"];
    career = data["career"];
    portfolio_link = data["portfolio_link"];
    created_at = data["created_at"];
    deleted_at = data["deleted_at"];
    participation_score = data["participation_score"];
    participation_id = data["participation_id"];
    skill_score = data["skill_score"];
    skill_id = data["skill_id"];
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
  Contest contest;
  String title;
  String description;
  DateTime? created_at;
  List<TeamMember> members;

  TeamRecruitmentPost({
    required this.recruitment_post_id,
    required this.team_id,
    required this.contest_id,
    required this.contest,
    required this.title,
    required this.description,
    this.created_at,
    required this.members,
  });

  static fromJson(post) {
    return TeamRecruitmentPost(
      recruitment_post_id: post['recruitment_post_id'],
      team_id: post['team_id'],
      contest_id: post['contest_id'],
      contest: Contest(
        contest_id: post['contest']['contest_id'],
        uploader_id: post['contest']['uploader_id'],
        name: post['contest']['name'],
        poster_image_link: post['contest']['poster_image_link'],
        tags: post['contest']['tags'],
        entry_requirements: post['contest']['entry_requirements'],
        hosting_organization: post['contest']['hosting_organization'],
        registration_start_date: DateTime.parse(post['contest']['registration_start_date']),
        registration_end_date: DateTime.parse(post['contest']['registration_end_date']),
        prizes: post['contest']['prizes'],
        application_method: post['contest']['application_method'],
        details: post['contest']['details'],
        interest_count: post['contest']['interest_count'],
        view_count: post['contest']['view_count'],
        created_at: DateTime.parse(post['contest']['created_at']),
        deleted_at: post['contest']['deleted_at'] != null ? DateTime.parse(post['contest']['deleted_at']) : null,
        state: post['contest']['state'],
      ),
      title: post['title'],
      description: post['description'],
      created_at: post['created_at'] != null ? DateTime.parse(post['created_at']) : null,
      members: (post['members'] as List)
          .map((member) => TeamMember(
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
              ))
          .toList(),
    );
  }
}
