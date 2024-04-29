// To parse this JSON data, do
//
//     final mProfileUpdate = mProfileUpdateFromJson(jsonString);

import 'dart:convert';

MProfileUpdate mProfileUpdateFromJson(String str) => MProfileUpdate.fromJson(json.decode(str));

String mProfileUpdateToJson(MProfileUpdate data) => json.encode(data.toJson());

class MProfileUpdate {
    bool status;
    String msg;
    List<dynamic> data;

    MProfileUpdate({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MProfileUpdate.fromJson(Map<String, dynamic> json) => MProfileUpdate(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
