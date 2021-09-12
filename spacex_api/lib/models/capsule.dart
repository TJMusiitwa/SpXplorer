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
  Status? status;
  Type? type;
  String id;

  factory Capsule.fromJson(Map<String, dynamic> json) => Capsule(
        reuseCount: json["reuse_count"],
        waterLandings: json["water_landings"],
        landLandings: json["land_landings"],
        lastUpdate: json["last_update"] == null ? null : json["last_update"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        serial: json["serial"],
        status: statusValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "reuse_count": reuseCount,
        "water_landings": waterLandings,
        "land_landings": landLandings,
        "last_update": lastUpdate == null ? null : lastUpdate,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "serial": serial,
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "id": id,
      };
}

enum Status { RETIRED, UNKNOWN, ACTIVE, DESTROYED }

final statusValues = EnumValues({
  "active": Status.ACTIVE,
  "destroyed": Status.DESTROYED,
  "retired": Status.RETIRED,
  "unknown": Status.UNKNOWN
});

enum Type { DRAGON_10, DRAGON_11, DRAGON_20 }

final typeValues = EnumValues({
  "Dragon 1.0": Type.DRAGON_10,
  "Dragon 1.1": Type.DRAGON_11,
  "Dragon 2.0": Type.DRAGON_20
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap as Map<T, String>;
  }
}
