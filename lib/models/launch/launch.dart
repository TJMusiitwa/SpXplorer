// To parse this JSON data, do
//
//     final launch = launchFromJson(jsonString);

import 'dart:convert';

List<Launch> launchFromJson(String str) =>
    List<Launch>.from(json.decode(str).map((x) => Launch.fromJson(x)));

String launchToJson(List<Launch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Launch {
  Launch({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    required this.net,
    this.window,
    required this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    required this.launchpad,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.autoUpdate,
    required this.tbd,
    this.launchLibraryId,
    required this.id,
  });

  Fairings? fairings;
  Links? links;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  bool net;
  int? window;
  String rocket;
  bool? success;
  List<Failure>? failures;
  String? details;
  List<String>? crew;
  List<String>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String launchpad;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  bool autoUpdate;
  bool tbd;
  String? launchLibraryId;
  String id;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        links: Links.fromJson(json["links"]),
        // staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]) == null
        //     ? null
        //     : DateTime.parse(json["static_fire_date_utc"]),
        // staticFireDateUnix: json["static_fire_date_unix"] == null
        //     ? null
        //     : json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"] == null ? -1 : json["window"],
        rocket: json["rocket"],
        //success: json["success"],
        failures: List<Failure>.from(
            json["failures"].map((x) => Failure.fromJson(x))),
        details: json["details"] == null ? null : json["details"],
        crew: List<String>.from(json["crew"].map((x) => x)),
        ships: List<String>.from(json["ships"].map((x) => x)),
        capsules: List<String>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"] == null
            ? null
            : json["launch_library_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings == null ? null : fairings!.toJson(),
        "links": links!.toJson(),
        "static_fire_date_utc": staticFireDateUtc == null
            ? null
            : staticFireDateUtc!.toIso8601String(),
        "static_fire_date_unix":
            staticFireDateUnix == null ? null : staticFireDateUnix,
        "net": net,
        "window": window == null ? null : window,
        "rocket": rocket,
        "success": success,
        "failures": List<dynamic>.from(failures!.map((x) => x.toJson())),
        "details": details == null ? null : details,
        "crew": List<dynamic>.from(crew!.map((x) => x)),
        "ships": List<dynamic>.from(ships!.map((x) => x)),
        "capsules": List<dynamic>.from(capsules!.map((x) => x)),
        "payloads": List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId == null ? null : launchLibraryId,
        "id": id,
      };
}

class Core {
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  bool? landingSuccess;
  String? landingType;
  String? landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType:
            json["landing_type"] == null ? 'N/A' : json["landing_type"],
        landpad: json["landpad"] == null ? 'N/A' : json["landpad"],
      );

  Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess == null ? null : landingSuccess,
        "landing_type": landingType == null ? null : landingType,
        "landpad": landpad == null ? null : landpad,
      };
}

class Failure {
  Failure({
    this.time,
    this.altitude,
    this.reason,
  });

  int? time;
  int? altitude;
  String? reason;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        time: json["time"],
        altitude: json["altitude"] == null ? null : json["altitude"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "altitude": altitude == null ? null : altitude,
        "reason": reason,
      };
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<String>? ships;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"] == null ? null : json["reused"],
        recoveryAttempt:
            json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        ships: List<String>.from(json["ships"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reused": reused == null ? null : reused,
        "recovery_attempt": recoveryAttempt == null ? null : recoveryAttempt,
        "recovered": recovered == null ? null : recovered,
        "ships": List<dynamic>.from(ships!.map((x) => x)),
      };
}

class Links {
  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: Patch.fromJson(json["patch"]),
        reddit: Reddit.fromJson(json["reddit"]),
        flickr: Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"] == null ? null : json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"] == null ? null : json["article"],
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch!.toJson(),
        "reddit": reddit!.toJson(),
        "flickr": flickr!.toJson(),
        "presskit": presskit == null ? null : presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article == null ? null : article,
        "wikipedia": wikipedia == null ? null : wikipedia,
      };
}

class Flickr {
  Flickr({
    this.small,
    this.original,
  });

  List<dynamic>? small;
  List<String>? original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: List<dynamic>.from(json["small"].map((x) => x)),
        original: List<String>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": List<dynamic>.from(small!.map((x) => x)),
        "original": List<dynamic>.from(original!.map((x) => x)),
      };
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String? small;
  String? large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"] == null ? null : json["small"],
        large: json["large"] == null ? null : json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  String? campaign;
  String? launch;
  String? media;
  String? recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"] == null ? null : json["campaign"],
        launch: json["launch"] == null ? null : json["launch"],
        media: json["media"] == null ? null : json["media"],
        recovery: json["recovery"] == null ? null : json["recovery"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign == null ? null : campaign,
        "launch": launch == null ? null : launch,
        "media": media == null ? null : media,
        "recovery": recovery == null ? null : recovery,
      };
}
