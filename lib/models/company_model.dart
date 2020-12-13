// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.headquarters,
    this.links,
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.summary,
    this.id,
  });

  Headquarters headquarters;
  Links links;
  String name;
  String founder;
  int founded;
  int employees;
  int vehicles;
  int launchSites;
  int testSites;
  String ceo;
  String cto;
  String coo;
  String ctoPropulsion;
  int valuation;
  String summary;
  String id;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        headquarters: Headquarters.fromJson(json["headquarters"]),
        links: Links.fromJson(json["links"]),
        name: json["name"],
        founder: json["founder"],
        founded: json["founded"],
        employees: json["employees"],
        vehicles: json["vehicles"],
        launchSites: json["launch_sites"],
        testSites: json["test_sites"],
        ceo: json["ceo"],
        cto: json["cto"],
        coo: json["coo"],
        ctoPropulsion: json["cto_propulsion"],
        valuation: json["valuation"],
        summary: json["summary"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "headquarters": headquarters.toJson(),
        "links": links.toJson(),
        "name": name,
        "founder": founder,
        "founded": founded,
        "employees": employees,
        "vehicles": vehicles,
        "launch_sites": launchSites,
        "test_sites": testSites,
        "ceo": ceo,
        "cto": cto,
        "coo": coo,
        "cto_propulsion": ctoPropulsion,
        "valuation": valuation,
        "summary": summary,
        "id": id,
      };
}

class Headquarters {
  Headquarters({
    this.address,
    this.city,
    this.state,
  });

  String address;
  String city;
  String state;

  factory Headquarters.fromJson(Map<String, dynamic> json) => Headquarters(
        address: json["address"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
      };
}

class Links {
  Links({
    this.website,
    this.flickr,
    this.twitter,
    this.elonTwitter,
  });

  String website;
  String flickr;
  String twitter;
  String elonTwitter;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        website: json["website"],
        flickr: json["flickr"],
        twitter: json["twitter"],
        elonTwitter: json["elon_twitter"],
      );

  Map<String, dynamic> toJson() => {
        "website": website,
        "flickr": flickr,
        "twitter": twitter,
        "elon_twitter": elonTwitter,
      };
}
