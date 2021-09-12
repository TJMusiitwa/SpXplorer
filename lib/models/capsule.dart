// To parse this JSON data, do
//
//     final capsule = capsuleFromJson(jsonString);

import 'dart:convert';

List<Capsule> capsuleFromJson(String str) =>
    List<Capsule>.from(json.decode(str).map((x) => Capsule.fromJson(x)));

String capsuleToJson(List<Capsule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Capsule {
  Capsule({
    required this.reuseCount,
    required this.waterLandings,
    required this.landLandings,
    this.lastUpdate,
    this.launches,
    required this.serial,
    this.status,
    this.type,
    required this.id,
  });

  int reuseCount;
  int waterLandings;
  int landLandings;
  String? lastUpdate;
  List<String>? launches;
  String serial;
  String? status;
  String? type;
  String id;

  factory Capsule.fromJson(Map<String, dynamic> json) => Capsule(
        reuseCount: json["reuse_count"],
        waterLandings: json["water_landings"],
        landLandings: json["land_landings"],
        lastUpdate: json["last_update"] == null ? null : json["last_update"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        serial: json["serial"],
        status: json["status"],
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "reuse_count": reuseCount,
        "water_landings": waterLandings,
        "land_landings": landLandings,
        "last_update": lastUpdate == null ? null : lastUpdate,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "serial": serial,
        "status": status,
        "type": type,
        "id": id,
      };
}
