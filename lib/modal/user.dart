import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.role,
    required this.statusId,
    this.avatarUrl,
  });

  String id;
  String email;
  String userName;
  String fullName;
  String role;
  int statusId;
  String? avatarUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    userName: json["userName"],
    fullName: json["fullName"],
    role: json["role"],
    statusId: json["statusId"],
    avatarUrl: json["avatarUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "userName": userName,
    "fullName": fullName,
    "role": role,
    "statusId": statusId,
    "avatarUrl": avatarUrl,
  };
}
