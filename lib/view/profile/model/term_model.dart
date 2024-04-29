// To parse this JSON data, do
//
//     final mTerm = mTermFromJson(jsonString);

import 'dart:convert';

MTerm mTermFromJson(String str) => MTerm.fromJson(json.decode(str));

String mTermToJson(MTerm data) => json.encode(data.toJson());

class MTerm {
    bool status;
    String msg;
    Data data;

    MTerm({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MTerm.fromJson(Map<String, dynamic> json) => MTerm(
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
    String termId;
    String termTitle;
    String termDescription;

    Data({
        required this.termId,
        required this.termTitle,
        required this.termDescription,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        termId: json["term_id"],
        termTitle: json["term_title"],
        termDescription: json["term_description"],
    );

    Map<String, dynamic> toJson() => {
        "term_id": termId,
        "term_title": termTitle,
        "term_description": termDescription,
    };
}
