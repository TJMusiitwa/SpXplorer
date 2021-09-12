// To parse this JSON data, do
//
//     final payload = payloadFromJson(jsonString);

import 'dart:convert';

List<Payload> payloadFromJson(String str) =>
    List<Payload>.from(json.decode(str).map((x) => Payload.fromJson(x)));

String payloadToJson(List<Payload> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payload {
  Payload({
    this.dragon,
    required this.name,
    required this.type,
    required this.reused,
    required this.launch,
    required this.customers,
    required this.noradIds,
    required this.nationalities,
    required this.manufacturers,
    required this.massKg,
    required this.massLbs,
    required this.orbit,
    required this.referenceSystem,
    required this.regime,
    required this.longitude,
    required this.semiMajorAxisKm,
    required this.eccentricity,
    required this.periapsisKm,
    required this.apoapsisKm,
    required this.inclinationDeg,
    required this.periodMin,
    required this.lifespanYears,
    required this.epoch,
    required this.meanMotion,
    required this.raan,
    required this.argOfPericenter,
    required this.meanAnomaly,
    required this.id,
  });

  Dragon? dragon;
  String name;
  Type? type;
  bool reused;
  String launch;
  List<String> customers;
  List<int> noradIds;
  List<String> nationalities;
  List<String> manufacturers;
  double massKg;
  double massLbs;
  Orbit? orbit;
  ReferenceSystem? referenceSystem;
  Regime? regime;
  double longitude;
  double semiMajorAxisKm;
  double eccentricity;
  double periapsisKm;
  double apoapsisKm;
  double inclinationDeg;
  double periodMin;
  double lifespanYears;
  DateTime? epoch;
  double meanMotion;
  double raan;
  double argOfPericenter;
  double meanAnomaly;
  String id;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        dragon: Dragon.fromJson(json["dragon"]),
        name: json["name"],
        type: typeValues.map[json["type"]],
        reused: json["reused"],
        launch: json["launch"],
        customers: List<String>.from(json["customers"].map((x) => x)),
        noradIds: List<int>.from(json["norad_ids"].map((x) => x)),
        nationalities: List<String>.from(json["nationalities"].map((x) => x)),
        manufacturers: List<String>.from(json["manufacturers"].map((x) => x)),
        massKg: json["mass_kg"] == null ? null : json["mass_kg"].toDouble(),
        massLbs: json["mass_lbs"] == null ? null : json["mass_lbs"].toDouble(),
        orbit: json["orbit"] == null ? null : orbitValues.map[json["orbit"]],
        referenceSystem: json["reference_system"] == null
            ? null
            : referenceSystemValues.map[json["reference_system"]],
        regime:
            json["regime"] == null ? null : regimeValues.map[json["regime"]],
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        semiMajorAxisKm: json["semi_major_axis_km"] == null
            ? null
            : json["semi_major_axis_km"].toDouble(),
        eccentricity: json["eccentricity"] == null
            ? null
            : json["eccentricity"].toDouble(),
        periapsisKm: json["periapsis_km"] == null
            ? null
            : json["periapsis_km"].toDouble(),
        apoapsisKm:
            json["apoapsis_km"] == null ? null : json["apoapsis_km"].toDouble(),
        inclinationDeg: json["inclination_deg"] == null
            ? null
            : json["inclination_deg"].toDouble(),
        periodMin:
            json["period_min"] == null ? null : json["period_min"].toDouble(),
        lifespanYears: json["lifespan_years"] == null
            ? null
            : json["lifespan_years"].toDouble(),
        epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
        meanMotion:
            json["mean_motion"] == null ? null : json["mean_motion"].toDouble(),
        raan: json["raan"] == null ? null : json["raan"].toDouble(),
        argOfPericenter: json["arg_of_pericenter"] == null
            ? null
            : json["arg_of_pericenter"].toDouble(),
        meanAnomaly: json["mean_anomaly"] == null
            ? null
            : json["mean_anomaly"].toDouble(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dragon": dragon!.toJson(),
        "name": name,
        "type": typeValues.reverse[type],
        "reused": reused,
        "launch": launch,
        "customers": List<dynamic>.from(customers.map((x) => x)),
        "norad_ids": List<dynamic>.from(noradIds.map((x) => x)),
        "nationalities": List<dynamic>.from(nationalities.map((x) => x)),
        "manufacturers": List<dynamic>.from(manufacturers.map((x) => x)),
        "mass_kg": massKg,
        "mass_lbs": massLbs,
        "orbit": orbit == null ? null : orbitValues.reverse[orbit],
        "reference_system": referenceSystem == null
            ? null
            : referenceSystemValues.reverse[referenceSystem],
        "regime": regime == null ? null : regimeValues.reverse[regime],
        "longitude": longitude,
        "semi_major_axis_km": semiMajorAxisKm,
        "eccentricity": eccentricity,
        "periapsis_km": periapsisKm,
        "apoapsis_km": apoapsisKm,
        "inclination_deg": inclinationDeg,
        "period_min": periodMin,
        "lifespan_years": lifespanYears,
        "epoch": epoch == null ? null : epoch!.toIso8601String(),
        "mean_motion": meanMotion,
        "raan": raan,
        "arg_of_pericenter": argOfPericenter,
        "mean_anomaly": meanAnomaly,
        "id": id,
      };
}

class Dragon {
  Dragon({
    this.capsule,
    this.massReturnedKg,
    this.massReturnedLbs,
    this.flightTimeSec,
    this.manifest,
    this.waterLanding,
    this.landLanding,
  });

  String? capsule;
  double? massReturnedKg;
  double? massReturnedLbs;
  int? flightTimeSec;
  String? manifest;
  bool? waterLanding;
  bool? landLanding;

  factory Dragon.fromJson(Map<String, dynamic> json) => Dragon(
        capsule: json["capsule"] == null ? null : json["capsule"],
        massReturnedKg: json["mass_returned_kg"] == null
            ? null
            : json["mass_returned_kg"].toDouble(),
        massReturnedLbs: json["mass_returned_lbs"] == null
            ? null
            : json["mass_returned_lbs"].toDouble(),
        flightTimeSec:
            json["flight_time_sec"] == null ? null : json["flight_time_sec"],
        manifest: json["manifest"] == null ? null : json["manifest"],
        waterLanding:
            json["water_landing"] == null ? null : json["water_landing"],
        landLanding: json["land_landing"] == null ? null : json["land_landing"],
      );

  Map<String, dynamic> toJson() => {
        "capsule": capsule == null ? null : capsule,
        "mass_returned_kg": massReturnedKg == null ? null : massReturnedKg,
        "mass_returned_lbs": massReturnedLbs == null ? null : massReturnedLbs,
        "flight_time_sec": flightTimeSec == null ? null : flightTimeSec,
        "manifest": manifest == null ? null : manifest,
        "water_landing": waterLanding == null ? null : waterLanding,
        "land_landing": landLanding == null ? null : landLanding,
      };
}

enum Orbit { LEO, ISS, PO, GTO, ES_L1, SSO, HCO, HEO, MEO, VLEO, SO, GEO, TLI }

final orbitValues = EnumValues({
  "ES-L1": Orbit.ES_L1,
  "GEO": Orbit.GEO,
  "GTO": Orbit.GTO,
  "HCO": Orbit.HCO,
  "HEO": Orbit.HEO,
  "ISS": Orbit.ISS,
  "LEO": Orbit.LEO,
  "MEO": Orbit.MEO,
  "PO": Orbit.PO,
  "SO": Orbit.SO,
  "SSO": Orbit.SSO,
  "TLI": Orbit.TLI,
  "VLEO": Orbit.VLEO
});

enum ReferenceSystem { GEOCENTRIC, HELIOCENTRIC, HIGHLY_ELLIPTICAL }

final referenceSystemValues = EnumValues({
  "geocentric": ReferenceSystem.GEOCENTRIC,
  "heliocentric": ReferenceSystem.HELIOCENTRIC,
  "highly-elliptical": ReferenceSystem.HIGHLY_ELLIPTICAL
});

enum Regime {
  LOW_EARTH,
  GEOSTATIONARY,
  L1_POINT,
  GEOSYNCHRONOUS,
  SUN_SYNCHRONOUS,
  HIGH_EARTH,
  SEMI_SYNCHRONOUS,
  HIGHLY_ELLIPTICAL,
  VERY_LOW_EARTH,
  MEDIUM_EARTH,
  SUB_ORBITAL,
  POLAR
}

final regimeValues = EnumValues({
  "geostationary": Regime.GEOSTATIONARY,
  "geosynchronous": Regime.GEOSYNCHRONOUS,
  "highly-elliptical": Regime.HIGHLY_ELLIPTICAL,
  "high-earth": Regime.HIGH_EARTH,
  "L1-point": Regime.L1_POINT,
  "low-earth": Regime.LOW_EARTH,
  "medium-earth": Regime.MEDIUM_EARTH,
  "polar": Regime.POLAR,
  "semi-synchronous": Regime.SEMI_SYNCHRONOUS,
  "sub-orbital": Regime.SUB_ORBITAL,
  "sun-synchronous": Regime.SUN_SYNCHRONOUS,
  "very-low-earth": Regime.VERY_LOW_EARTH
});

enum Type {
  SATELLITE,
  DRAGON_BOILERPLATE,
  DRAGON_10,
  DRAGON_11,
  LANDER,
  CREW_DRAGON,
  DRAGON_20
}

final typeValues = EnumValues({
  "Crew Dragon": Type.CREW_DRAGON,
  "Dragon 1.0": Type.DRAGON_10,
  "Dragon 1.1": Type.DRAGON_11,
  "Dragon 2.0": Type.DRAGON_20,
  "Dragon Boilerplate": Type.DRAGON_BOILERPLATE,
  "Lander": Type.LANDER,
  "Satellite": Type.SATELLITE
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
