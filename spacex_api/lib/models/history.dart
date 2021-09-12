// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    this.links,
    required this.title,
    required this.eventDateUtc,
    required this.eventDateUnix,
    required this.details,
    required this.id,
  });

  Links? links;
  String title;
  DateTime eventDateUtc;
  int eventDateUnix;
  String details;
  String id;

  factory History.fromJson(Map<String, dynamic> json) => History(
        links: Links.fromJson(json["links"]),
        title: json["title"],
        eventDateUtc: DateTime.parse(json["event_date_utc"]),
        eventDateUnix: json["event_date_unix"],
        details: json["details"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "links": links!.toJson(),
        "title": title,
        "event_date_utc": eventDateUtc.toIso8601String(),
        "event_date_unix": eventDateUnix,
        "details": details,
        "id": id,
      };
}

class Links {
  Links({
    this.article,
  });

  String? article;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        article: json["article"] == null ? null : json["article"],
      );

  Map<String, dynamic> toJson() => {
        "article": article == null ? null : article,
      };
}
