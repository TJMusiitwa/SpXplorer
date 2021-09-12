// To parse this JSON data, do
//
//     final spaceTrack = spaceTrackFromJson(jsonString);

import 'dart:convert';

List<SpaceTrack> spaceTrackFromJson(String str) =>
    List<SpaceTrack>.from(json.decode(str).map((x) => SpaceTrack.fromJson(x)));

String spaceTrackToJson(List<SpaceTrack> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceTrack {
  SpaceTrack({
    this.ccsdsOmmVers,
    this.comment,
    this.creationDate,
    this.originator,
    this.objectName,
    this.objectId,
    this.centerName,
    this.refFrame,
    this.timeSystem,
    this.meanElementTheory,
    this.epoch,
    this.meanMotion,
    this.eccentricity,
    this.inclination,
    this.raOfAscNode,
    this.argOfPericenter,
    this.meanAnomaly,
    this.ephemerisType,
    this.classificationType,
    this.noradCatId,
    this.elementSetNo,
    this.revAtEpoch,
    this.bstar,
    this.meanMotionDot,
    this.meanMotionDdot,
    this.semimajorAxis,
    this.period,
    this.apoapsis,
    this.periapsis,
    this.objectType,
    this.rcsSize,
    this.countryCode,
    this.launchDate,
    this.site,
    this.decayDate,
    this.decayed,
    this.file,
    this.gpId,
    this.tleLine0,
    this.tleLine1,
    this.tleLine2,
  });

  String? ccsdsOmmVers;
  String? comment;
  DateTime? creationDate;
  String? originator;
  String? objectName;
  String? objectId;
  String? centerName;
  String? refFrame;
  String? timeSystem;
  String? meanElementTheory;
  DateTime? epoch;
  double? meanMotion;
  double? eccentricity;
  double? inclination;
  double? raOfAscNode;
  double? argOfPericenter;
  double? meanAnomaly;
  int? ephemerisType;
  String? classificationType;
  int? noradCatId;
  int? elementSetNo;
  int? revAtEpoch;
  double? bstar;
  double? meanMotionDot;
  double? meanMotionDdot;
  double? semimajorAxis;
  double? period;
  double? apoapsis;
  double? periapsis;
  String? objectType;
  String? rcsSize;
  String? countryCode;
  DateTime? launchDate;
  String? site;
  String? decayDate;
  int? decayed;
  int? file;
  int? gpId;
  String? tleLine0;
  String? tleLine1;
  String? tleLine2;

  factory SpaceTrack.fromJson(Map<String, dynamic> json) => SpaceTrack(
        ccsdsOmmVers: json["CCSDS_OMM_VERS"],
        comment: json["COMMENT"],
        creationDate: json["CREATION_DATE"] == null
            ? null
            : DateTime.parse(json["CREATION_DATE"]),
        originator: json["ORIGINATOR"],
        objectName: json["OBJECT_NAME"],
        objectId: json["OBJECT_ID"],
        centerName: json["CENTER_NAME"] == null ? null : json["CENTER_NAME"],
        refFrame: json["REF_FRAME"],
        timeSystem: json["TIME_SYSTEM"],
        meanElementTheory: json["MEAN_ELEMENT_THEORY"],
        epoch: json["EPOCH"] == null ? null : DateTime.parse(json["EPOCH"]),
        meanMotion: json["MEAN_MOTION"],
        eccentricity: json["ECCENTRICITY"],
        inclination: json["INCLINATION"],
        //raOfAscNode: json["RA_OF_ASC_NODE"],
        //argOfPericenter: json["ARG_OF_PERICENTER"],
        //meanAnomaly: json["MEAN_ANOMALY"],
        ephemerisType: json["EPHEMERIS_TYPE"],
        classificationType: json["CLASSIFICATION_TYPE"],
        noradCatId: json["NORAD_CAT_ID"],
        elementSetNo: json["ELEMENT_SET_NO"],
        revAtEpoch: json["REV_AT_EPOCH"],
        bstar: json["BSTAR"],
        //meanMotionDot: json["MEAN_MOTION_DOT"] as double,
        //meanMotionDdot: json["MEAN_MOTION_DDOT"] as double,
        semimajorAxis: json["SEMIMAJOR_AXIS"],
        period: json["PERIOD"],
        //apoapsis: json["APOAPSIS"] as double,
        //periapsis: json["PERIAPSIS"],
        objectType: json["OBJECT_TYPE"],
        rcsSize: json["RCS_SIZE"],
        countryCode: json["COUNTRY_CODE"],
        launchDate: json["LAUNCH_DATE"] == null
            ? null
            : DateTime.parse(json["LAUNCH_DATE"]),
        site: json["SITE"],
        decayDate: json["DECAY_DATE"],
        decayed: json["DECAYED"],
        file: json["FILE"],
        gpId: json["GP_ID"],
        tleLine0: json["TLE_LINE0"],
        tleLine1: json["TLE_LINE1"],
        tleLine2: json["TLE_LINE2"],
      );

  Map<String, dynamic> toJson() => {
        "CCSDS_OMM_VERS": ccsdsOmmVers == null ? null : ccsdsOmmVers,
        "COMMENT": comment == null ? null : comment,
        "CREATION_DATE":
            creationDate == null ? null : creationDate!.toIso8601String(),
        "ORIGINATOR": originator == null ? null : originator,
        "OBJECT_NAME": objectName == null ? null : objectName,
        "OBJECT_ID": objectId == null ? null : objectId,
        "CENTER_NAME": centerName == null ? null : centerName,
        "REF_FRAME": refFrame == null ? null : refFrame,
        "TIME_SYSTEM": timeSystem == null ? null : timeSystem,
        "MEAN_ELEMENT_THEORY":
            meanElementTheory == null ? null : meanElementTheory,
        "EPOCH": epoch == null ? null : epoch!.toIso8601String(),
        "MEAN_MOTION": meanMotion == null ? null : meanMotion,
        "ECCENTRICITY": eccentricity == null ? null : eccentricity,
        "INCLINATION": inclination == null ? null : inclination,
        "RA_OF_ASC_NODE": raOfAscNode == null ? null : raOfAscNode,
        "ARG_OF_PERICENTER": argOfPericenter == null ? null : argOfPericenter,
        "MEAN_ANOMALY": meanAnomaly == null ? null : meanAnomaly,
        "EPHEMERIS_TYPE": ephemerisType == null ? null : ephemerisType,
        "CLASSIFICATION_TYPE":
            classificationType == null ? null : classificationType,
        "NORAD_CAT_ID": noradCatId == null ? null : noradCatId,
        "ELEMENT_SET_NO": elementSetNo == null ? null : elementSetNo,
        "REV_AT_EPOCH": revAtEpoch == null ? null : revAtEpoch,
        "BSTAR": bstar == null ? null : bstar,
        "MEAN_MOTION_DOT": meanMotionDot == null ? null : meanMotionDot,
        "MEAN_MOTION_DDOT": meanMotionDdot == null ? null : meanMotionDdot,
        "SEMIMAJOR_AXIS": semimajorAxis == null ? null : semimajorAxis,
        "PERIOD": period == null ? null : period,
        "APOAPSIS": apoapsis == null ? null : apoapsis,
        "PERIAPSIS": periapsis == null ? null : periapsis,
        "OBJECT_TYPE": objectType == null ? null : objectType,
        "RCS_SIZE": rcsSize,
        "COUNTRY_CODE": countryCode == null ? null : countryCode,
        "LAUNCH_DATE": launchDate == null
            ? null
            : "${launchDate!.year.toString().padLeft(4, '0')}-${launchDate!.month.toString().padLeft(2, '0')}-${launchDate!.day.toString().padLeft(2, '0')}",
        "SITE": site == null ? null : site,
        "DECAY_DATE": decayDate,
        "DECAYED": decayed == null ? null : decayed,
        "FILE": file == null ? null : file,
        "GP_ID": gpId == null ? null : gpId,
        "TLE_LINE0": tleLine0 == null ? null : tleLine0,
        "TLE_LINE1": tleLine1 == null ? null : tleLine1,
        "TLE_LINE2": tleLine2 == null ? null : tleLine2,
      };
}
