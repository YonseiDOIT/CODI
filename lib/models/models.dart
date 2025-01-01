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
