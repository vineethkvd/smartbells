// To parse this JSON data, do
//
//     final mPolicy = mPolicyFromJson(jsonString);

import 'dart:convert';

MPolicy mPolicyFromJson(String str) => MPolicy.fromJson(json.decode(str));

String mPolicyToJson(MPolicy data) => json.encode(data.toJson());

class MPolicy {
    bool status;
    String msg;
    Data data;

    MPolicy({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MPolicy.fromJson(Map<String, dynamic> json) => MPolicy(
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
    String policyId;
    String policyTitle;
    String policyDescribtion;

    Data({
        required this.policyId,
        required this.policyTitle,
        required this.policyDescribtion,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        policyId: json["policy_id"],
        policyTitle: json["policy_title"],
        policyDescribtion: json["policy_describtion"],
    );

    Map<String, dynamic> toJson() => {
        "policy_id": policyId,
        "policy_title": policyTitle,
        "policy_describtion": policyDescribtion,
    };
}
