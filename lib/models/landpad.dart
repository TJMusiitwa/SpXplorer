// To parse this JSON data, do
//
//     final landpad = landpadFromJson(jsonString);

import 'dart:convert';

List<Landpad> landpadFromJson(String str) =>
    List<Landpad>.from(json.decode(str).map((x) => Landpad.fromJson(x)));

String landpadToJson(List<Landpad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Landpad {
  Landpad({
    required this.images,
    required this.name,
    required this.fullName,
    required this.status,
    required this.type,
    required this.locality,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.landingAttempts,
    required this.landingSuccesses,
    required this.wikipedia,
    required this.details,
    this.launches,
    required this.id,
  });

  Images images;
  String name;
  String fullName;
  String status;
  String type;
  String locality;
  String region;
  double latitude;
  double longitude;
  int landingAttempts;
  int landingSuccesses;
  String wikipedia;
  String details;
  List<String>? launches;
  String id;

  factory Landpad.fromJson(Map<String, dynamic> json) => Landpad(
        images: Images.fromJson(json["images"]),
        name: json["name"],
        fullName: json["full_name"],
        status: json["status"],
        type: json["type"],
        locality: json["locality"],
        region: json["region"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        landingAttempts: json["landing_attempts"],
        landingSuccesses: json["landing_successes"],
        wikipedia: json["wikipedia"],
        details: json["details"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "images": images.toJson(),
        "name": name,
        "full_name": fullName,
        "status": status,
        "type": type,
        "locality": locality,
        "region": region,
        "latitude": latitude,
        "longitude": longitude,
        "landing_attempts": landingAttempts,
        "landing_successes": landingSuccesses,
        "wikipedia": wikipedia,
        "details": details,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "id": id,
      };
}

class Images {
  Images({
    required this.large,
  });

  List<String> large;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large: List<String>.from(json["large"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "large": List<dynamic>.from(large.map((x) => x)),
      };
}
