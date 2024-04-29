// To parse this JSON data, do
//
//     final mEvent = mEventFromJson(jsonString);

import 'dart:convert';

MEvent mEventFromJson(String str) => MEvent.fromJson(json.decode(str));

String mEventToJson(MEvent data) => json.encode(data.toJson());

class MEvent {
    bool status;
    String msg;
    Data data;

    MEvent({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory MEvent.fromJson(Map<String, dynamic> json) => MEvent(
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
    List<Event> events;
    int itemCount;

    Data({
        required this.events,
        required this.itemCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "itemCount": itemCount,
    };
}

class Event {
    String eventId;
    String events;

    Event({
        required this.eventId,
        required this.events,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventId: json["event_id"],
        events: json["events"],
    );

    Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "events": events,
    };
}
