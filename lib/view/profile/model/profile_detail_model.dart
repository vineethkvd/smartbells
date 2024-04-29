// To parse this JSON data, do
//
//     final mProfileDetail = mProfileDetailFromJson(jsonString);

import 'dart:convert';

MProfileDetail mProfileDetailFromJson(String str) => MProfileDetail.fromJson(json.decode(str));

String mProfileDetailToJson(MProfileDetail data) => json.encode(data.toJson());

class MProfileDetail {
    bool status;
    String msg;
    Data data;

    MProfileDetail({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MProfileDetail.fromJson(Map<String, dynamic> json) => MProfileDetail(
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
    String userId;
    dynamic userUsername;
    String userName;
    String userEmailid;
    String userMobileno;
    String userGender;

    Data({
        required this.userId,
        this.userUsername,
        required this.userName,
        required this.userEmailid,
        required this.userMobileno,
        required this.userGender,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userUsername: json["user_username"],
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userGender: json["user_gender"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_username": userUsername,
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_gender": userGender,
    };
}
