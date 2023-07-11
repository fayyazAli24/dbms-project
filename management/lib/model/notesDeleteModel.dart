// To parse this JSON data, do
//
//     final notesDeleteDataModel = notesDeleteDataModelFromJson(jsonString);

import 'dart:convert';

NotesDeleteDataModel notesDeleteDataModelFromJson(String str) => NotesDeleteDataModel.fromJson(json.decode(str));

String notesDeleteDataModelToJson(NotesDeleteDataModel data) => json.encode(data.toJson());

class NotesDeleteDataModel {
  bool error;
  String message;

  NotesDeleteDataModel({
    required this.error,
    required this.message,
  });

  factory NotesDeleteDataModel.fromJson(Map<String, dynamic> json) => NotesDeleteDataModel(
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };
}
