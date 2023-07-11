// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool error;
  String message;
  int data;

  UserModel({
    required this.error,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    error: json["error"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data,
  };
}
