// To parse this JSON data, do
//
//     final launchpad = launchpadFromJson(jsonString);

import 'dart:convert';

List<Launchpad> launchpadFromJson(String str) =>
    List<Launchpad>.from(json.decode(str).map((x) => Launchpad.fromJson(x)));

String launchpadToJson(List<Launchpad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Launchpad {
  Launchpad({
    required this.images,
    required this.name,
    required this.fullName,
    required this.locality,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.launchAttempts,
    required this.launchSuccesses,
    this.rockets,
    required this.timezone,
    this.launches,
    required this.status,
    required this.details,
    required this.id,
  });

  Images images;
  String name;
  String fullName;
  String locality;
  String region;
  double latitude;
  double longitude;
  int launchAttempts;
  int launchSuccesses;
  List<String>? rockets;
  String timezone;
  List<String>? launches;
  String status;
  String details;
  String id;

  factory Launchpad.fromJson(Map<String, dynamic> json) => Launchpad(
        images: Images.fromJson(json["images"]),
        name: json["name"],
        fullName: json["full_name"],
        locality: json["locality"],
        region: json["region"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        launchAttempts: json["launch_attempts"],
        launchSuccesses: json["launch_successes"],
        rockets: List<String>.from(json["rockets"].map((x) => x)),
        timezone: json["timezone"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        status: json["status"],
        details: json["details"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "images": images.toJson(),
        "name": name,
        "full_name": fullName,
        "locality": locality,
        "region": region,
        "latitude": latitude,
        "longitude": longitude,
        "launch_attempts": launchAttempts,
        "launch_successes": launchSuccesses,
        "rockets": List<dynamic>.from(rockets!.map((x) => x)),
        "timezone": timezone,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "status": status,
        "details": details,
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
