// To parse this JSON data, do
//
//     final sites = sitesFromJson(jsonString);

import 'dart:convert';

List<Sites> sitesFromJson(String str) =>
    List<Sites>.from(json.decode(str).map((x) => Sites.fromJson(x)));

class Sites {
  Sites({
    this.id,
    this.name,
    this.region,
    this.country,
    this.url,
  });

  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  factory Sites.fromJson(Map<String, dynamic> json) => Sites(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],

        url: json["url"],
      );
}
