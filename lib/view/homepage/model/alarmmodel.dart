// To parse this JSON data, do
//
//     final alarmadd = alarmaddFromJson(jsonString);

import 'dart:convert';

List<Alarmadd> alarmaddFromJson(String str) => List<Alarmadd>.from(json.decode(str).map((x) => Alarmadd.fromJson(x)));

String alarmaddToJson(List<Alarmadd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alarmadd {
  int id=0;
  int days;
  List<int> hours;

  Alarmadd({

    required this.days,
    required this.hours,
  });

  factory Alarmadd.fromJson(Map<String, dynamic> json) => Alarmadd(

    days: json["days"],
    hours: List<int>.from(json["hours"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "days": days,
    "hours": List<dynamic>.from(hours.map((x) => x)),
  };
}
