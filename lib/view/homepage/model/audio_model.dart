// To parse this JSON data, do
//
//     final mAudio = mAudioFromJson(jsonString);

import 'dart:convert';

MAudio mAudioFromJson(String str) => MAudio.fromJson(json.decode(str));

String mAudioToJson(MAudio data) => json.encode(data.toJson());

class MAudio {
    bool status;
    String msg;
    Data data;

    MAudio({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MAudio.fromJson(Map<String, dynamic> json) => MAudio(
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
    List<Audio> audio;
    int itemCount;

    Data({
        required this.audio,
        required this.itemCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        audio: List<Audio>.from(json["audio"].map((x) => Audio.fromJson(x))),
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "audio": List<dynamic>.from(audio.map((x) => x.toJson())),
        "itemCount": itemCount,
    };
}

class Audio {
    String audId;
    dynamic audName;
    String audio;

    Audio({
        required this.audId,
        this.audName,
        required this.audio,
    });

    factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        audId: json["aud_id"],
        audName: json["aud_name"],
        audio: json["audio"],
    );

    Map<String, dynamic> toJson() => {
        "aud_id": audId,
        "aud_name": audName,
        "audio": audio,
    };
}
