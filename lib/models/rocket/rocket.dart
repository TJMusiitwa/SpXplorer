// To parse this JSON data, do
//
//     final rocket = rocketFromJson(jsonString);

import 'dart:convert';

List<Rocket> rocketFromJson(String str) =>
    List<Rocket>.from(json.decode(str).map((x) => Rocket.fromJson(x)));

String rocketToJson(List<Rocket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rocket {
  Rocket({
    required this.height,
    required this.diameter,
    required this.mass,
    required this.firstStage,
    required this.secondStage,
    required this.engines,
    required this.landingLegs,
    required this.payloadWeights,
    required this.flickrImages,
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
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

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
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
    required this.meters,
    required this.feet,
  });

  double meters;
  double feet;

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"] == null ? 0.0 : json["meters"].toDouble(),
        feet: json["feet"] == null ? 0.0 : json["feet"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "meters": meters,
        "feet": feet,
      };
}

class Engines {
  Engines({
    required this.isp,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.number,
    required this.type,
    required this.version,
    required this.layout,
    required this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.thrustToWeight,
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

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        isp: Isp.fromJson(json["isp"]),
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        number: json["number"],
        type: json["type"],
        version: json["version"],
        layout: json["layout"] == null ? 'N/A' : json["layout"],
        engineLossMax:
            json["engine_loss_max"] == null ? 0 : json["engine_loss_max"],
        propellant1: json["propellant_1"],
        propellant2: json["propellant_2"],
        thrustToWeight: json["thrust_to_weight"] == null
            ? 0.0
            : double.parse(json["thrust_to_weight"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "isp": isp.toJson(),
        "thrust_sea_level": thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum.toJson(),
        "number": number,
        "type": type,
        "version": version,
        "layout": layout,
        "engine_loss_max": engineLossMax,
        "propellant_1": propellant1,
        "propellant_2": propellant2,
        "thrust_to_weight": thrustToWeight,
      };
}

class Isp {
  Isp({
    required this.seaLevel,
    required this.vacuum,
  });

  int seaLevel;
  int vacuum;

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
    required this.kN,
    required this.lbf,
  });

  int kN;
  int lbf;

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
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"].toDouble(),
        burnTimeSec: json["burn_time_sec"] == null ? 0 : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust_sea_level": thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum.toJson(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec,
      };
}

class LandingLegs {
  LandingLegs({
    required this.number,
    this.material,
  });

  int number;
  String? material;

  factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
        number: json["number"],
        material: json["material"] == null ? 'N/A' : json["material"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "material": material == null ? 'N/A' : material,
      };
}

class Mass {
  Mass({
    required this.kg,
    required this.lb,
  });

  int kg;
  int lb;

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
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  String id;
  String name;
  int kg;
  int lb;

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
    required this.thrust,
    required this.payloads,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  Thrust thrust;
  Payloads payloads;
  bool reusable;
  int engines;
  double fuelAmountTons;
  int burnTimeSec;

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        thrust: Thrust.fromJson(json["thrust"]),
        payloads: Payloads.fromJson(json["payloads"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"].toDouble(),
        burnTimeSec: json["burn_time_sec"] == null ? 0 : json["burn_time_sec"],
      );

  Map<String, dynamic> toJson() => {
        "thrust": thrust.toJson(),
        "payloads": payloads.toJson(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec,
      };
}

class Payloads {
  Payloads({
    required this.compositeFairing,
    required this.option1,
  });

  CompositeFairing compositeFairing;
  String option1;

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
    required this.height,
    required this.diameter,
  });

  Diameter height;
  Diameter diameter;

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
