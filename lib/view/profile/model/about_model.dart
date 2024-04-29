// To parse this JSON data, do
//
//     final mAbout = mAboutFromJson(jsonString);

import 'dart:convert';

MAbout mAboutFromJson(String str) => MAbout.fromJson(json.decode(str));

String mAboutToJson(MAbout data) => json.encode(data.toJson());

class MAbout {
    bool status;
    String msg;
    Data data;

    MAbout({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MAbout.fromJson(Map<String, dynamic> json) => MAbout(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    String aboutId;
    String aboutTitle;
    String ourMission;
    String outService;
    String content;

    Data({
        required this.aboutId,
        required this.aboutTitle,
        required this.ourMission,
        required this.outService,
        required this.content,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        aboutId: json["about_id"],
        aboutTitle: json["about_title"],
        ourMission: json["our_mission"],
        outService: json["out_service"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "about_id": aboutId,
        "about_title": aboutTitle,
        "our_mission": ourMission,
        "out_service": outService,
        "content": content,
    };
}
