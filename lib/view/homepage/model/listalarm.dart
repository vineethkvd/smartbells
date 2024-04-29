// To parse this JSON data, do
//
//     final listalarm = listalarmFromJson(jsonString);

import 'dart:convert';

import 'alarmmodel.dart';

List<Listalarm> listalarmFromJson(String str) => List<Listalarm>.from(json.decode(str).map((x) => Listalarm.fromJson(x)));

String listalarmToJson(List<Listalarm> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listalarm {
  int id;
  String name;
  String tunepath;
  String content;
  List<Alarmadd> alarm;

  Listalarm({
    required this.id,
    required this.name,
    required this.tunepath,
    required this.content,
    required this.alarm,
  });

  factory Listalarm.fromJson(Map<String, dynamic> json) => Listalarm(
    id: json["id"],
    name: json["name"],
    tunepath: json["tunepath"],
    content: json["content"],
    alarm: List<Alarmadd>.from(json["alarm"].map((x) => Alarmadd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tunepath": tunepath,
    "content": content,
    "alarm": List<dynamic>.from(alarm.map((x) => x.toJson())),
  };
}

// class Alarm {
//   int id;
//   int days;
//   List<int> hours;
//
//   Alarm({
//     required this.id,
//     required this.days,
//     required this.hours,
//   });
//
//   factory Alarm.fromJson(Map<String, dynamic> json) => Alarm(
//     id: json["id"],
//     days: json["days"],
//     hours: List<int>.from(json["hours"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "days": days,
//     "hours": List<dynamic>.from(hours.map((x) => x)),
//   };
// }
