// To parse this JSON data, do
//
//     final dragon = dragonFromJson(jsonString);

import 'dart:convert';

List<Dragon> dragonFromJson(String str) =>
    List<Dragon>.from(json.decode(str).map((x) => Dragon.fromJson(x)));

String dragonToJson(List<Dragon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dragon {
  Dragon({
    required this.heatShield,
    required this.launchPayloadMass,
    required this.launchPayloadVol,
    required this.returnPayloadMass,
    required this.returnPayloadVol,
    required this.pressurizedCapsule,
    required this.trunk,
    required this.heightWTrunk,
    required this.diameter,
    required this.firstFlight,
    required this.flickrImages,
    required this.name,
    required this.type,
    required this.active,
    required this.crewCapacity,
    required this.sidewallAngleDeg,
    required this.orbitDurationYr,
    required this.dryMassKg,
    required this.dryMassLb,
    required this.thrusters,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  HeatShield heatShield;
  PayloadMass launchPayloadMass;
  LaunchPayloadVol launchPayloadVol;
  PayloadMass returnPayloadMass;
  LaunchPayloadVol returnPayloadVol;
  PressurizedCapsule pressurizedCapsule;
  Trunk trunk;
  Diameter heightWTrunk;
  Diameter diameter;
  DateTime firstFlight;
  List<String> flickrImages;
  String name;
  String type;
  bool active;
  int crewCapacity;
  int sidewallAngleDeg;
  int orbitDurationYr;
  int dryMassKg;
  int dryMassLb;
  List<Thruster> thrusters;
  String wikipedia;
  String description;
  String id;

  factory Dragon.fromJson(Map<String, dynamic> json) => Dragon(
        heatShield: HeatShield.fromJson(json["heat_shield"]),
        launchPayloadMass: PayloadMass.fromJson(json["launch_payload_mass"]),
        launchPayloadVol: LaunchPayloadVol.fromJson(json["launch_payload_vol"]),
        returnPayloadMass: PayloadMass.fromJson(json["return_payload_mass"]),
        returnPayloadVol: LaunchPayloadVol.fromJson(json["return_payload_vol"]),
        pressurizedCapsule:
            PressurizedCapsule.fromJson(json["pressurized_capsule"]),
        trunk: Trunk.fromJson(json["trunk"]),
        heightWTrunk: Diameter.fromJson(json["height_w_trunk"]),
        diameter: Diameter.fromJson(json["diameter"]),
        firstFlight: DateTime.parse(json["first_flight"]),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        active: json["active"],
        crewCapacity: json["crew_capacity"],
        sidewallAngleDeg: json["sidewall_angle_deg"],
        orbitDurationYr: json["orbit_duration_yr"],
        dryMassKg: json["dry_mass_kg"],
        dryMassLb: json["dry_mass_lb"],
        thrusters: List<Thruster>.from(
            json["thrusters"].map((x) => Thruster.fromJson(x))),
        wikipedia: json["wikipedia"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "heat_shield": heatShield.toJson(),
        "launch_payload_mass": launchPayloadMass.toJson(),
        "launch_payload_vol": launchPayloadVol.toJson(),
        "return_payload_mass": returnPayloadMass.toJson(),
        "return_payload_vol": returnPayloadVol.toJson(),
        "pressurized_capsule": pressurizedCapsule.toJson(),
        "trunk": trunk.toJson(),
        "height_w_trunk": heightWTrunk.toJson(),
        "diameter": diameter.toJson(),
        "first_flight":
            "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "name": name,
        "type": type,
        "active": active,
        "crew_capacity": crewCapacity,
        "sidewall_angle_deg": sidewallAngleDeg,
        "orbit_duration_yr": orbitDurationYr,
        "dry_mass_kg": dryMassKg,
        "dry_mass_lb": dryMassLb,
        "thrusters": List<dynamic>.from(thrusters.map((x) => x.toJson())),
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
        meters: json["meters"].toDouble(),
        feet: json["feet"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "meters": meters,
        "feet": feet,
      };
}

class HeatShield {
  HeatShield({
    required this.material,
    required this.sizeMeters,
    required this.tempDegrees,
    required this.devPartner,
  });

  String material;
  double sizeMeters;
  int tempDegrees;
  String devPartner;

  factory HeatShield.fromJson(Map<String, dynamic> json) => HeatShield(
        material: json["material"],
        sizeMeters: json["size_meters"].toDouble(),
        tempDegrees: json["temp_degrees"],
        devPartner: json["dev_partner"],
      );

  Map<String, dynamic> toJson() => {
        "material": material,
        "size_meters": sizeMeters,
        "temp_degrees": tempDegrees,
        "dev_partner": devPartner,
      };
}

class PayloadMass {
  PayloadMass({
    required this.kg,
    required this.lb,
  });

  int kg;
  int lb;

  factory PayloadMass.fromJson(Map<String, dynamic> json) => PayloadMass(
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "kg": kg,
        "lb": lb,
      };
}

class LaunchPayloadVol {
  LaunchPayloadVol({
    required this.cubicMeters,
    required this.cubicFeet,
  });

  int cubicMeters;
  int cubicFeet;

  factory LaunchPayloadVol.fromJson(Map<String, dynamic> json) =>
      LaunchPayloadVol(
        cubicMeters: json["cubic_meters"],
        cubicFeet: json["cubic_feet"],
      );

  Map<String, dynamic> toJson() => {
        "cubic_meters": cubicMeters,
        "cubic_feet": cubicFeet,
      };
}

class PressurizedCapsule {
  PressurizedCapsule({
    required this.payloadVolume,
  });

  LaunchPayloadVol payloadVolume;

  factory PressurizedCapsule.fromJson(Map<String, dynamic> json) =>
      PressurizedCapsule(
        payloadVolume: LaunchPayloadVol.fromJson(json["payload_volume"]),
      );

  Map<String, dynamic> toJson() => {
        "payload_volume": payloadVolume.toJson(),
      };
}

class Thruster {
  Thruster({
    required this.type,
    required this.amount,
    required this.pods,
    required this.fuel1,
    required this.fuel2,
    required this.isp,
    required this.thrust,
  });

  String type;
  int amount;
  int pods;
  String fuel1;
  String fuel2;
  int isp;
  Thrust thrust;

  factory Thruster.fromJson(Map<String, dynamic> json) => Thruster(
        type: json["type"],
        amount: json["amount"],
        pods: json["pods"],
        fuel1: json["fuel_1"],
        fuel2: json["fuel_2"],
        isp: json["isp"],
        thrust: Thrust.fromJson(json["thrust"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "pods": pods,
        "fuel_1": fuel1,
        "fuel_2": fuel2,
        "isp": isp,
        "thrust": thrust.toJson(),
      };
}

class Thrust {
  Thrust({
    required this.kN,
    required this.lbf,
  });

  double kN;
  int lbf;

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"].toDouble(),
        lbf: json["lbf"],
      );

  Map<String, dynamic> toJson() => {
        "kN": kN,
        "lbf": lbf,
      };
}

class Trunk {
  Trunk({
    required this.trunkVolume,
    required this.cargo,
  });

  LaunchPayloadVol trunkVolume;
  Cargo cargo;

  factory Trunk.fromJson(Map<String, dynamic> json) => Trunk(
        trunkVolume: LaunchPayloadVol.fromJson(json["trunk_volume"]),
        cargo: Cargo.fromJson(json["cargo"]),
      );

  Map<String, dynamic> toJson() => {
        "trunk_volume": trunkVolume.toJson(),
        "cargo": cargo.toJson(),
      };
}

class Cargo {
  Cargo({
    required this.solarArray,
    required this.unpressurizedCargo,
  });

  int solarArray;
  bool unpressurizedCargo;

  factory Cargo.fromJson(Map<String, dynamic> json) => Cargo(
        solarArray: json["solar_array"],
        unpressurizedCargo: json["unpressurized_cargo"],
      );

  Map<String, dynamic> toJson() => {
        "solar_array": solarArray,
        "unpressurized_cargo": unpressurizedCargo,
      };
}
