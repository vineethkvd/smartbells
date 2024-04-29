// To parse this JSON data, do
//
//     final mBanner = mBannerFromJson(jsonString);

import 'dart:convert';

MBanner mBannerFromJson(String str) => MBanner.fromJson(json.decode(str));

String mBannerToJson(MBanner data) => json.encode(data.toJson());

class MBanner {
    bool status;
    String msg;
    Data data;

    MBanner({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MBanner.fromJson(Map<String, dynamic> json) => MBanner(
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
    List<Banner> banner;
    int itemCount;

    Data({
        required this.banner,
        required this.itemCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        itemCount: json["itemCount"]??0,
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "itemCount": itemCount,
    };
}

class Banner {
    String adId;
    String adCategory;
    String adImage;
    String adUrl;
    DateTime adRegdate;
    String adStatus;

    Banner({
        required this.adId,
        required this.adCategory,
        required this.adImage,
        required this.adUrl,
        required this.adRegdate,
        required this.adStatus,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        adId: json["ad_id"],
        adCategory: json["ad_category"],
        adImage: json["ad_image"],
        adUrl: json["ad_url"],
        adRegdate: DateTime.parse(json["ad_regdate"]),
        adStatus: json["ad_status"],
    );

    Map<String, dynamic> toJson() => {
        "ad_id": adId,
        "ad_category": adCategory,
        "ad_image": adImage,
        "ad_url": adUrl,
        "ad_regdate": adRegdate.toIso8601String(),
        "ad_status": adStatus,
    };
}
