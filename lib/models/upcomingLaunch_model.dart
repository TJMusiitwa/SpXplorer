// To parse this JSON data, do
//
//     final upcomingLaunch = upcomingLaunchFromJson(jsonString);

import 'dart:convert';

List<UpcomingLaunch> upcomingLaunchFromJson(String str) =>
    List<UpcomingLaunch>.from(
        json.decode(str).map((x) => UpcomingLaunch.fromJson(x)));

String upcomingLaunchToJson(List<UpcomingLaunch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingLaunch {
  UpcomingLaunch({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.tdb,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.autoUpdate,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.id,
  });

  dynamic fairings;
  Links links;
  DateTime staticFireDateUtc;
  int staticFireDateUnix;
  bool tdb;
  bool net;
  int window;
  String rocket;
  bool success;
  List<dynamic> failures;
  String details;
  List<dynamic> crew;
  List<dynamic> ships;
  List<String> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  String id;

  factory UpcomingLaunch.fromJson(Map<String, dynamic> json) => UpcomingLaunch(
        fairings: json["fairings"],
        links: Links.fromJson(json["links"]),
        staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        tdb: json["tdb"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: List<dynamic>.from(json["failures"].map((x) => x)),
        details: json["details"],
        crew: List<dynamic>.from(json["crew"].map((x) => x)),
        ships: List<dynamic>.from(json["ships"].map((x) => x)),
        capsules: List<String>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"],
        autoUpdate: json["auto_update"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings,
        "links": links.toJson(),
        "static_fire_date_utc": staticFireDateUtc.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "tdb": tdb,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures": List<dynamic>.from(failures.map((x) => x)),
        "details": details,
        "crew": List<dynamic>.from(crew.map((x) => x)),
        "ships": List<dynamic>.from(ships.map((x) => x)),
        "capsules": List<dynamic>.from(capsules.map((x) => x)),
        "payloads": List<dynamic>.from(payloads.map((x) => x)),
        "launchpad": launchpad,
        "auto_update": autoUpdate,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
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

  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
      );

  Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
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

  Patch patch;
  Reddit reddit;
  Flickr flickr;
  String presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: Patch.fromJson(json["patch"]),
        reddit: Reddit.fromJson(json["reddit"]),
        flickr: Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "patch": patch.toJson(),
        "reddit": reddit.toJson(),
        "flickr": flickr.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  Flickr({
    this.small,
    this.original,
  });

  List<dynamic> small;
  List<String> original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: List<dynamic>.from(json["small"].map((x) => x)),
        original: List<String>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": List<dynamic>.from(small.map((x) => x)),
        "original": List<dynamic>.from(original.map((x) => x)),
      };
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String small;
  String large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
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

  String campaign;
  String launch;
  String media;
  dynamic recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );

  Map<String, dynamic> toJson() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
      };
}
