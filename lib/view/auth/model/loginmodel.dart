// To parse this JSON data, do
//
//     final mLogin = mLoginFromJson(jsonString);

import 'dart:convert';

MLogin mLoginFromJson(String str) => MLogin.fromJson(json.decode(str));

String mLoginToJson(MLogin data) => json.encode(data.toJson());

class MLogin {
    bool status;
    String msg;
    List<Datum> data;

    MLogin({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MLogin.fromJson(Map<String, dynamic> json) => MLogin(
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
    String userId;
    dynamic userUsername;
    String userName;
    String userEmailid;
    String userMobileno;
    dynamic userGender;
    String userOtp;
    dynamic userAddress;
    dynamic userState;
    dynamic userDistrict;
    dynamic userPincode;
    dynamic userPassword;
    dynamic userCpassword;
    DateTime userRegdate;
    dynamic userUpdatedDate;
    dynamic userIsdeleted;
    dynamic userStatus;

    Datum({
        required this.userId,
        this.userUsername,
        required this.userName,
        required this.userEmailid,
        required this.userMobileno,
        this.userGender,
        required this.userOtp,
        this.userAddress,
        this.userState,
        this.userDistrict,
        this.userPincode,
        this.userPassword,
        this.userCpassword,
        required this.userRegdate,
        this.userUpdatedDate,
        this.userIsdeleted,
        this.userStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        userUsername: json["user_username"],
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userGender: json["user_gender"],
        userOtp: json["user_otp"],
        userAddress: json["user_address"],
        userState: json["user_state"],
        userDistrict: json["user_district"],
        userPincode: json["user_pincode"],
        userPassword: json["user_password"],
        userCpassword: json["user_Cpassword"],
        userRegdate: DateTime.parse(json["user_regdate"]),
        userUpdatedDate: json["user_updated_date"],
        userIsdeleted: json["user_isdeleted"],
        userStatus: json["user_status"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_username": userUsername,
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_gender": userGender,
        "user_otp": userOtp,
        "user_address": userAddress,
        "user_state": userState,
        "user_district": userDistrict,
        "user_pincode": userPincode,
        "user_password": userPassword,
        "user_Cpassword": userCpassword,
        "user_regdate": userRegdate.toIso8601String(),
        "user_updated_date": userUpdatedDate,
        "user_isdeleted": userIsdeleted,
        "user_status": userStatus,
    };
}
