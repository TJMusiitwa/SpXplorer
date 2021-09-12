// To parse this JSON data, do
//
//     final roadster = roadsterFromJson(jsonString);

import 'dart:convert';

Roadster roadsterFromJson(String str) => Roadster.fromJson(json.decode(str));

String roadsterToJson(Roadster data) => json.encode(data.toJson());

class Roadster {
  Roadster({
    required this.name,
    required this.launchDateUtc,
    required this.launchDateUnix,
    required this.launchMassKg,
    required this.launchMassLbs,
    required this.noradId,
    required this.epochJd,
    required this.orbitType,
    required this.apoapsisAu,
    required this.periapsisAu,
    required this.semiMajorAxisAu,
    required this.eccentricity,
    required this.inclination,
    required this.longitude,
    required this.periapsisArg,
    required this.periodDays,
    required this.speedKph,
    required this.speedMph,
    required this.earthDistanceKm,
    required this.earthDistanceMi,
    required this.marsDistanceKm,
    required this.marsDistanceMi,
    required this.flickrImages,
    required this.wikipedia,
    required this.video,
    required this.details,
    required this.id,
  });

  String name;
  DateTime launchDateUtc;
  int launchDateUnix;
  int launchMassKg;
  int launchMassLbs;
  int noradId;
  double epochJd;
  String orbitType;
  double apoapsisAu;
  double periapsisAu;
  double semiMajorAxisAu;
  double eccentricity;
  double inclination;
  double longitude;
  double periapsisArg;
  double periodDays;
  double speedKph;
  double speedMph;
  double earthDistanceKm;
  double earthDistanceMi;
  double marsDistanceKm;
  double marsDistanceMi;
  List<String> flickrImages;
  String wikipedia;
  String video;
  String details;
  String id;

  factory Roadster.fromJson(Map<String, dynamic> json) => Roadster(
        name: json["name"],
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchDateUnix: json["launch_date_unix"],
        launchMassKg: json["launch_mass_kg"],
        launchMassLbs: json["launch_mass_lbs"],
        noradId: json["norad_id"],
        epochJd: json["epoch_jd"].toDouble(),
        orbitType: json["orbit_type"],
        apoapsisAu: json["apoapsis_au"].toDouble(),
        periapsisAu: json["periapsis_au"].toDouble(),
        semiMajorAxisAu: json["semi_major_axis_au"].toDouble(),
        eccentricity: json["eccentricity"].toDouble(),
        inclination: json["inclination"].toDouble(),
        longitude: json["longitude"].toDouble(),
        periapsisArg: json["periapsis_arg"].toDouble(),
        periodDays: json["period_days"].toDouble(),
        speedKph: json["speed_kph"].toDouble(),
        speedMph: json["speed_mph"].toDouble(),
        earthDistanceKm: json["earth_distance_km"].toDouble(),
        earthDistanceMi: json["earth_distance_mi"].toDouble(),
        marsDistanceKm: json["mars_distance_km"].toDouble(),
        marsDistanceMi: json["mars_distance_mi"].toDouble(),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        wikipedia: json["wikipedia"],
        video: json["video"],
        details: json["details"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "launch_date_utc": launchDateUtc.toIso8601String(),
        "launch_date_unix": launchDateUnix,
        "launch_mass_kg": launchMassKg,
        "launch_mass_lbs": launchMassLbs,
        "norad_id": noradId,
        "epoch_jd": epochJd,
        "orbit_type": orbitType,
        "apoapsis_au": apoapsisAu,
        "periapsis_au": periapsisAu,
        "semi_major_axis_au": semiMajorAxisAu,
        "eccentricity": eccentricity,
        "inclination": inclination,
        "longitude": longitude,
        "periapsis_arg": periapsisArg,
        "period_days": periodDays,
        "speed_kph": speedKph,
        "speed_mph": speedMph,
        "earth_distance_km": earthDistanceKm,
        "earth_distance_mi": earthDistanceMi,
        "mars_distance_km": marsDistanceKm,
        "mars_distance_mi": marsDistanceMi,
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "wikipedia": wikipedia,
        "video": video,
        "details": details,
        "id": id,
      };
}
