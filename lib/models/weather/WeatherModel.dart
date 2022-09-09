// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

import 'package:weatherapp/models/weather/Forecast_Model.dart';
import 'package:weatherapp/models/weather/Location_Model.dart';

import 'Current_Model.dart';
Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

class Weather {
  Weather({
    this.location,
    this.current,
    this.forecast,
  });

  Location? location;
  Current? current;
  Forecast? forecast;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}

enum WindDir { WNW, NW, NNW, W }

final windDirValues = EnumValues(
    {"NNW": WindDir.NNW, "NW": WindDir.NW, "W": WindDir.W, "WNW": WindDir.WNW});

class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  String ?sunrise;
  String ?sunset;
  String ?moonrise;
  String ?moonset;
  String ?moonPhase;
  String ?moonIllumination;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonPhase: json["moon_phase"] == null ? null : json["moon_phase"],
        moonIllumination: json["moon_illumination"] == null
            ? null
            : json["moon_illumination"],
      );

 }


class AirQuality {
  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  String? co;
  String ?no2;
  String ?o3;
  String ?so2;
  String ?pm25;
  String ?pm10;
  int? usEpaIndex;
  int ?gbDefraIndex;

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: json["co"] == null ? null : json["co"],
        no2: json["no2"] == null ? null : json["no2"],
        o3: json["o3"] == null ? null : json["o3"],
        so2: json["so2"] == null ? null : json["so2"],
        pm25: json["pm2_5"] == null ? null : json["pm2_5"],
        pm10: json["pm10"] == null ? null : json["pm10"],
        usEpaIndex: json["us-epa-index"] == null ? null : json["us-epa-index"],
        gbDefraIndex:
            json["gb-defra-index"] == null ? null : json["gb-defra-index"],
      );

 }


class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
