// To parse this JSON data, do
//
//     final notesDataModel = notesDataModelFromJson(jsonString);

import 'dart:convert';

List<NotesDataModel> notesDataModelFromJson(String str) => List<NotesDataModel>.from(json.decode(str).map((x) => NotesDataModel.fromJson(x)));

String notesDataModelToJson(List<NotesDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesDataModel {
  int notesId;
  String email;
  String? notes;
  String? date;
  String start;
  String end;
  String reminder;
  String repeat;

  NotesDataModel({
    required this.notesId,
    required this.email,
    this.notes,
    this.date,
    required this.start,
    required this.end,
    required this.reminder,
    required this.repeat,
  });

  factory NotesDataModel.fromJson(Map<String, dynamic> json) => NotesDataModel(
    notesId: json["notes_id"],
    email: json["email"],
    notes: json["notes"],
    date: json["date"],
    start: json["start"],
    end: json["end"],
    reminder: json["reminder"],
    repeat: json["repeat"],
  );

  Map<String, dynamic> toJson() => {
    "notes_id": notesId,
    "email": email,
    "notes": notes,
    "date": date,
    "start": start,
    "end": end,
    "reminder": reminder,
    "repeat": repeat,
  };
}
