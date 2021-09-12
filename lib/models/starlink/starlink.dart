// To parse this JSON data, do
//
//     final starlink = starlinkFromJson(jsonString);

import 'dart:convert';

import 'spacetrack.dart';

List<Starlink> starlinkFromJson(String str) =>
    List<Starlink>.from(json.decode(str).map((x) => Starlink.fromJson(x)));

String starlinkToJson(List<Starlink> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Starlink {
  Starlink({
    required this.spaceTrack,
    required this.version,
    required this.launch,
    this.longitude,
    this.latitude,
    this.heightKm,
    this.velocityKms,
    required this.id,
  });

  SpaceTrack spaceTrack;
  String version;
  String launch;
  double? longitude;
  double? latitude;
  double? heightKm;
  double? velocityKms;
  String id;

  factory Starlink.fromJson(Map<String, dynamic> json) => Starlink(
        spaceTrack: SpaceTrack.fromJson(json["spaceTrack"]),
        version: json["version"],
        launch: json["launch"],
        longitude: json["longitude"] ?? 0.0,
        latitude: json["latitude"] ?? 0.0,
        heightKm: json["height_km"],
        velocityKms: json["velocity_kms"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "spaceTrack": spaceTrack.toJson(),
        "version": version,
        "launch": launch,
        "longitude": longitude,
        "latitude": latitude,
        "height_km": heightKm,
        "velocity_kms": velocityKms,
        "id": id,
      };
}
