// To parse this JSON data, do
//
//     final ships = shipsFromJson(jsonString);

import 'dart:convert';

List<Ships> shipsFromJson(String str) =>
    List<Ships>.from(json.decode(str).map((x) => Ships.fromJson(x)));

String shipsToJson(List<Ships> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ships {
  Ships({
    this.legacyId,
    this.model,
    this.type,
    this.roles,
    this.imo,
    this.mmsi,
    this.abs,
    this.shipClass,
    this.massKg,
    this.massLbs,
    this.yearBuilt,
    this.homePort,
    this.status,
    this.speedKn,
    this.courseDeg,
    this.latitude,
    this.longitude,
    this.lastAisUpdate,
    this.link,
    this.image,
    this.launches,
    this.name,
    this.active,
    this.id,
  });

  String legacyId;
  String model;
  String type;
  List<String> roles;
  int imo;
  int mmsi;
  int abs;
  int shipClass;
  int massKg;
  int massLbs;
  int yearBuilt;
  String homePort;
  String status;
  dynamic speedKn;
  dynamic courseDeg;
  dynamic latitude;
  dynamic longitude;
  dynamic lastAisUpdate;
  String link;
  String image;
  List<String> launches;
  String name;
  bool active;
  String id;

  factory Ships.fromJson(Map<String, dynamic> json) => Ships(
        legacyId: json["legacy_id"] == null ? null : json["legacy_id"],
        model: json["model"] == null ? null : json["model"],
        type: json["type"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        imo: json["imo"] == null ? null : json["imo"],
        mmsi: json["mmsi"] == null ? null : json["mmsi"],
        abs: json["abs"] == null ? null : json["abs"],
        shipClass: json["class"] == null ? null : json["class"],
        massKg: json["mass_kg"] == null ? null : json["mass_kg"],
        massLbs: json["mass_lbs"] == null ? null : json["mass_lbs"],
        yearBuilt: json["year_built"] == null ? null : json["year_built"],
        homePort: json["home_port"],
        status: json["status"] == null ? null : json["status"],
        speedKn: json["speed_kn"],
        courseDeg: json["course_deg"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        lastAisUpdate: json["last_ais_update"],
        link: json["link"] == null ? null : json["link"],
        image: json["image"] == null ? null : json["image"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        name: json["name"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "legacy_id": legacyId == null ? null : legacyId,
        "model": model == null ? null : model,
        "type": type,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "imo": imo == null ? null : imo,
        "mmsi": mmsi == null ? null : mmsi,
        "abs": abs == null ? null : abs,
        "class": shipClass == null ? null : shipClass,
        "mass_kg": massKg == null ? null : massKg,
        "mass_lbs": massLbs == null ? null : massLbs,
        "year_built": yearBuilt == null ? null : yearBuilt,
        "home_port": homePort,
        "status": status == null ? null : status,
        "speed_kn": speedKn,
        "course_deg": courseDeg,
        "latitude": latitude,
        "longitude": longitude,
        "last_ais_update": lastAisUpdate,
        "link": link == null ? null : link,
        "image": image == null ? null : image,
        "launches": List<dynamic>.from(launches.map((x) => x)),
        "name": name,
        "active": active,
        "id": id,
      };
}
