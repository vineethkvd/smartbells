// To parse this JSON data, do
//
//     final mRegister = mRegisterFromJson(jsonString);

import 'dart:convert';

MRegister mRegisterFromJson(String str) => MRegister.fromJson(json.decode(str));

String mRegisterToJson(MRegister data) => json.encode(data.toJson());

class MRegister {
    bool status;
    String msg;
    List<Datum> data;

    MRegister({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MRegister.fromJson(Map<String, dynamic> json) => MRegister(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String userName;
    String userEmailid;
    String userMobileno;
    String userGender;

    Datum({
        required this.userName,
        required this.userEmailid,
        required this.userMobileno,
        required this.userGender,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userGender: json["user_gender"],
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_gender": userGender,
    };
}
