// To parse this JSON data, do
//
//     final roadster = roadsterFromJson(jsonString);

import 'dart:convert';

Roadster roadsterFromJson(String str) => Roadster.fromJson(json.decode(str));

String roadsterToJson(Roadster data) => json.encode(data.toJson());

class Roadster {
  Roadster({
    this.flickrImages,
    this.name,
    this.launchDateUtc,
    this.launchDateUnix,
    this.launchMassKg,
    this.launchMassLbs,
    this.noradId,
    this.epochJd,
    this.orbitType,
    this.apoapsisAu,
    this.periapsisAu,
    this.semiMajorAxisAu,
    this.eccentricity,
    this.inclination,
    this.longitude,
    this.periapsisArg,
    this.periodDays,
    this.speedKph,
    this.speedMph,
    this.earthDistanceKm,
    this.earthDistanceMi,
    this.marsDistanceKm,
    this.marsDistanceMi,
    this.wikipedia,
    this.video,
    this.details,
    this.id,
  });

  List<String> flickrImages;
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
  String wikipedia;
  String video;
  String details;
  String id;

  factory Roadster.fromJson(Map<String, dynamic> json) => Roadster(
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
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
        wikipedia: json["wikipedia"],
        video: json["video"],
        details: json["details"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
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
        "wikipedia": wikipedia,
        "video": video,
        "details": details,
        "id": id,
      };
}
