

import 'dart:convert';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  bool error;
  String message;
  int data;

  NotesModel({
    required this.error,
    required this.message,
    required this.data,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
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
