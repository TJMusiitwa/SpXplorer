// To parse this JSON data, do
//
//     final rockets = rocketsFromJson(jsonString);

import 'dart:convert';

class Rockets {
  Rockets({
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.payloadWeights,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  Diameter height;
  Diameter diameter;
  Mass mass;
  FirstStage firstStage;
  SecondStage secondStage;
  Engines engines;
  LandingLegs landingLegs;
  List<PayloadWeight> payloadWeights;
  List<String> flickrImages;
  String name;
  String type;
  bool active;
  int stages;
  int boosters;
  int costPerLaunch;
  int successRatePct;
  DateTime firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;

  factory Rockets.fromRawJson(String str) => Rockets.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rockets.fromJson(Map<String, dynamic> json) => Rockets(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
        mass: Mass.fromJson(json["mass"]),
        firstStage: FirstStage.fromJson(json["first_stage"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
        engines: Engines.fromJson(json["engines"]),
        landingLegs: LandingLegs.fromJson(json["landing_legs"]),
        payloadWeights: List<PayloadWeight>.from(
            json["payload_weights"].map((x) => PayloadWeight.fromJson(x))),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        active: json["active"],
        stages: json["stages"],
        boosters: json["boosters"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        firstFlight: DateTime.parse(json["first_flight"]),
        country: json["country"],
        company: json["company"],
        wikipedia: json["wikipedia"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "height": height.toJson(),
        "diameter": diameter.toJson(),
        "mass": mass.toJson(),
        "first_stage": firstStage.toJson(),
        "second_stage": secondStage.toJson(),
        "engines": engines.toJson(),
        "landing_legs": landingLegs.toJson(),
        "payload_weights":
            List<dynamic>.from(payloadWeights.map((x) => x.toJson())),
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "name": name,
        "type": type,
        "active": active,
        "stages": stages,
        "boosters": boosters,
        "cost_per_launch": costPerLaunch,
        "success_rate_pct": successRatePct,
        "first_flight":
            "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country,
        "company": company,
        "wikipedia": wikipedia,
        "description": description,
        "id": id,
      };
}

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  double meters;
  double feet;

  factory Diameter.fromRawJson(String str) =>
      Diameter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"] == null ? null : json["meters"].toDouble(),
        feet: json["feet"] == null ? null : json["feet"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "meters": meters == null ? null : meters,
        "feet": feet == null ? null : feet,
      };
}

class Engines {
  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  Isp isp;
  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  int number;
  String type;
  String version;
  String layout;
  int engineLossMax;
  String propellant1;
  String propellant2;
  double thrustToWeight;

  factory Engines.fromRawJson(String str) => Engines.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        isp: Isp.fromJson(json["isp"]),
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        number: json["number"],
        type: json["type"],
        version: json["version"],
        layout: json["layout"] == null ? null : json["layout"],
        engineLossMax:
            json["engine_loss_max"] == null ? null : json["engine_loss_max"],
        propellant1: json["propellant_1"],
        propellant2: json["propellant_2"],
        thrustToWeight: json["thrust_to_weight"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "isp": isp.toJson(),
        "thrust_sea_level": thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum.toJson(),
        "number": number,
        "type": type,
        "version": version,
        "layout": layout == null ? null : layout,
        "engine_loss_max": engineLossMax == null ? null : engineLossMax,
        "propellant_1": propellant1,
        "propellant_2": propellant2,
        "thrust_to_weight": thrustToWeight,
      };
}

class Isp {
  Isp({
    this.seaLevel,
    this.vacuum,
  });

  int seaLevel;
  int vacuum;

  factory Isp.fromRawJson(String str) => Isp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        seaLevel: json["sea_level"],
        vacuum: json["vacuum"],
      );

  Map<String, dynamic> toJson() => {
        "sea_level": seaLevel,
        "vacuum": vacuum,
      };
}

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  int kN;
  int lbf;

  factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"],
        lbf: json["lbf"],
      );

  Map<String, dynamic> toJson() => {
        "kN": kN,
        "lbf": lbf,
      };
}

class FirstStage {
  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory FirstStage.fromRawJson(String str) =>
      FirstStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"].toDouble(),
        burnTimeSec:
            json["burn_time_sec"] == null ? null : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust_sea_level": thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum.toJson(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
      };
}

class LandingLegs {
  LandingLegs({
    this.number,
    this.material,
  });

  int number;
  String material;

  factory LandingLegs.fromRawJson(String str) =>
      LandingLegs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
        number: json["number"],
        material: json["material"] == null ? null : json["material"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "material": material == null ? null : material,
      };
}

class Mass {
  Mass({
    this.kg,
    this.lb,
  });

  int kg;
  int lb;

  factory Mass.fromRawJson(String str) => Mass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "kg": kg,
        "lb": lb,
      };
}

class PayloadWeight {
  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  String id;
  String name;
  int kg;
  int lb;

  factory PayloadWeight.fromRawJson(String str) =>
      PayloadWeight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => PayloadWeight(
        id: json["id"],
        name: json["name"],
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kg": kg,
        "lb": lb,
      };
}

class SecondStage {
  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrust;
  Payloads payloads;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory SecondStage.fromRawJson(String str) =>
      SecondStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        thrust: Thrust.fromJson(json["thrust"]),
        payloads: Payloads.fromJson(json["payloads"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"].toDouble(),
        burnTimeSec:
            json["burn_time_sec"] == null ? null : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust": thrust.toJson(),
        "payloads": payloads.toJson(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec == null ? null : burnTimeSec,
      };
}

class Payloads {
  Payloads({
    this.compositeFairing,
    this.option1,
  });

  CompositeFairing compositeFairing;
  String option1;

  factory Payloads.fromRawJson(String str) =>
      Payloads.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payloads.fromJson(Map<String, dynamic> json) => Payloads(
        compositeFairing: CompositeFairing.fromJson(json["composite_fairing"]),
        option1: json["option_1"],
      );

  Map<String, dynamic> toJson() => {
        "composite_fairing": compositeFairing.toJson(),
        "option_1": option1,
      };
}

class CompositeFairing {
  CompositeFairing({
    this.height,
    this.diameter,
  });

  Diameter height;
  Diameter diameter;

  factory CompositeFairing.fromRawJson(String str) =>
      CompositeFairing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompositeFairing.fromJson(Map<String, dynamic> json) =>
      CompositeFairing(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
      );

  Map<String, dynamic> toJson() => {
        "height": height.toJson(),
        "diameter": diameter.toJson(),
      };
}
