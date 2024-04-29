// To parse this JSON data, do
//
//     final mSupport = mSupportFromJson(jsonString);

import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../main.dart';

MSupport mSupportFromJson(String str) => MSupport.fromJson(json.decode(str));

String mSupportToJson(MSupport data) => json.encode(data.toJson());

class MSupport {
    bool status;
    String msg;
    List<dynamic> data;

    MSupport({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MSupport.fromJson(Map<String, dynamic> json) => MSupport(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
    static String _toSimpleEnum(NotificationLifeCycle lifeCycle) =>
        lifeCycle.toString().split('.').last;
    @pragma("vm:entry-point")
    static Future<void> onNotificationCreatedMethod(
        ReceivedNotification receivedNotification) async {
        Fluttertoast.showToast(
            msg:
            'Notification created on ${_toSimpleEnum(receivedNotification.createdLifeCycle!)}',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.green,
            gravity: ToastGravity.BOTTOM);
    }


}
