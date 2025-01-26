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
      count: json['count'],
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
