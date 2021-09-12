// To parse this JSON data, do
//
//     final crew = crewFromJson(jsonString);

import 'dart:convert';

List<Crew> crewFromJson(String str) =>
    List<Crew>.from(json.decode(str).map((x) => Crew.fromJson(x)));

String crewToJson(List<Crew> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Crew {
  Crew({
    required this.name,
    this.agency,
    required this.image,
    this.wikipedia,
    this.launches,
    this.status,
    required this.id,
  });

  String name;
  String? agency;
  String image;
  String? wikipedia;
  List<String>? launches;
  String? status;
  String id;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        name: json["name"],
        agency: json["agency"],
        image: json["image"],
        wikipedia: json["wikipedia"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "agency": agency,
        "image": image,
        "wikipedia": wikipedia,
        "launches": List<dynamic>.from(launches!.map((x) => x)),
        "status": status,
        "id": id,
      };
}
