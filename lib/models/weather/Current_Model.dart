
import 'WeatherModel.dart';

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
  });

  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  WindDir? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  Map<String, double>? airQuality;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"] == null ? null : json["wind_kph"].toDouble(),
        windDegree: json["wind_degree"] == null ? null : json["wind_degree"],
        windDir: json["wind_dir"] == null
            ? null
            : windDirValues.map![json["wind_dir"]],
        pressureMb: json["pressure_mb"] == null ? null : json["pressure_mb"],
        pressureIn:
            json["pressure_in"] == null ? null : json["pressure_in"].toDouble(),
        precipMm: json["precip_mm"] == null ? null : json["precip_mm"],
        precipIn: json["precip_in"] == null ? null : json["precip_in"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        cloud: json["cloud"] == null ? null : json["cloud"],
        feelslikeC:
            json["feelslike_c"] == null ? null : json["feelslike_c"].toDouble(),
        feelslikeF:
            json["feelslike_f"] == null ? null : json["feelslike_f"].toDouble(),
        visKm: json["vis_km"] == null ? null : json["vis_km"],
        visMiles: json["vis_miles"] == null ? null : json["vis_miles"],
        uv: json["uv"] == null ? null : json["uv"],
        gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble(),
        gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble(),
        airQuality: json["air_quality"] == null
            ? null
            : Map.from(json["air_quality"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );
}
