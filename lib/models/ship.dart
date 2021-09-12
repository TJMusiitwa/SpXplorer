// To parse this JSON data, do
//
//     final ship = shipFromJson(jsonString);

import 'dart:convert';

List<Ship> shipFromJson(String str) =>
    List<Ship>.from(json.decode(str).map((x) => Ship.fromJson(x)));

String shipToJson(List<Ship> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ship {
  Ship({
    this.lastAisUpdate,
    required this.legacyId,
    this.model,
    required this.type,
    this.roles,
    required this.imo,
    required this.mmsi,
    required this.abs,
    this.shipClass,
    required this.massKg,
    required this.massLbs,
    required this.yearBuilt,
    this.homePort,
    this.status,
    this.speedKn,
    this.courseDeg,
    this.latitude,
    this.longitude,
    this.link,
    this.image,
    required this.name,
    required this.active,
    this.launches,
    required this.id,
  });

  String? lastAisUpdate;
  String? legacyId;
  String? model;
  String? type;
  List<String>? roles;
  int imo;
  int mmsi;
  int abs;
  int? shipClass;
  int massKg;
  int massLbs;
  int yearBuilt;
  String? homePort;
  String? status;
  int? speedKn;
  int? courseDeg;
  double? latitude;
  double? longitude;
  String? link;
  String? image;
  String name;
  bool active;
  List<String>? launches;
  String id;

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
        lastAisUpdate: json["last_ais_update"],
        legacyId: json["legacy_id"],
        model: json["model"],
        type: json["type"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        imo: json["imo"] == null ? 0 : json["imo"],
        mmsi: json["mmsi"] == null ? 0 : json["mmsi"],
        abs: json["abs"] == null ? 0 : json["abs"],
        shipClass: json["class"] == null ? 0 : json["class"],
        massKg: json["mass_kg"] == null ? 0 : json["mass_kg"],
        massLbs: json["mass_lbs"] == null ? 0 : json["mass_lbs"],
        yearBuilt: json["year_built"] == null ? 0 : json["year_built"],
        homePort: json["home_port"],
        status: json["status"],
        speedKn: json["speed_kn"],
        courseDeg: json["course_deg"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        link: json["link"],
        image: json["image"],
        name: json["name"],
        active: json["active"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "last_ais_update": lastAisUpdate,
        "legacy_id": legacyId == null ? null : legacyId,
        "model": model == null ? null : model,
        "type": type,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "imo": imo,
        "mmsi": mmsi,
        "abs": abs,
        "class": shipClass == null ? null : shipClass,
        "mass_kg": massKg,
        "mass_lbs": massLbs,
        "year_built": yearBuilt,
        "home_port": homePort,
        "status": status == null ? null : status,
        "speed_kn": speedKn,
        "course_deg": courseDeg,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "link": link == null ? null : link,
        "image": image == null ? null : image,
        "name": name,
        "active": active,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "id": id,
      };
}

enum HomePort { PORT_OF_LOS_ANGELES, PORT_CANAVERAL, FORT_LAUDERDALE }

final homePortValues = EnumValues({
  "Fort Lauderdale": HomePort.FORT_LAUDERDALE,
  "Port Canaveral": HomePort.PORT_CANAVERAL,
  "Port of Los Angeles": HomePort.PORT_OF_LOS_ANGELES
});

enum Role {
  SUPPORT_SHIP,
  BARGE_TUG,
  DRAGON_RECOVERY,
  ASDS_BARGE,
  ASDS_TUG,
  FAIRING_RECOVERY
}

final roleValues = EnumValues({
  "ASDS barge": Role.ASDS_BARGE,
  "ASDS Tug": Role.ASDS_TUG,
  "Barge Tug": Role.BARGE_TUG,
  "Dragon Recovery": Role.DRAGON_RECOVERY,
  "Fairing Recovery": Role.FAIRING_RECOVERY,
  "Support Ship": Role.SUPPORT_SHIP
});

enum Type { TUG, CARGO, BARGE, HIGH_SPEED_CRAFT }

final typeValues = EnumValues({
  "Barge": Type.BARGE,
  "Cargo": Type.CARGO,
  "High Speed Craft": Type.HIGH_SPEED_CRAFT,
  "Tug": Type.TUG
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
