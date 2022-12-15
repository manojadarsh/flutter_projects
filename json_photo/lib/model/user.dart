class User {
  final int userID;
  final int id;
  final String title;
  final String body;

  User({this.userID, this.id, this.title, this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}