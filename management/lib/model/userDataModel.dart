// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) => List<UserDataModel>.from(json.decode(str).map((x) => UserDataModel.fromJson(x)));

String userDataModelToJson(List<UserDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  int userId;
  String name;
  String email;
  String password;
  DateTime createdAt;

  UserDataModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "password": password,
    "created_at": createdAt.toIso8601String(),
  };
}
