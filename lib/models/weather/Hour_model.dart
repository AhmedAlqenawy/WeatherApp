
import 'WeatherModel.dart';

class Hour {
  Hour({
    this.timeEpoch,
    this.time,
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
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.airQuality,
  });

  int? timeEpoch;
  String? time;
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
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;
  AirQuality? airQuality;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"] == null ? null : json["time_epoch"],
        time: json["time"] == null ? null : json["time"],
        tempC: json["temp_c"] == null ? null : json["temp_c"].toDouble(),
        tempF: json["temp_f"] == null ? null : json["temp_f"].toDouble(),
        isDay: json["is_day"] == null ? null : json["is_day"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"] == null ? null : json["wind_mph"].toDouble(),
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
        windchillC:
            json["windchill_c"] == null ? null : json["windchill_c"].toDouble(),
        windchillF:
            json["windchill_f"] == null ? null : json["windchill_f"].toDouble(),
        heatindexC:
            json["heatindex_c"] == null ? null : json["heatindex_c"].toDouble(),
        heatindexF:
            json["heatindex_f"] == null ? null : json["heatindex_f"].toDouble(),
        dewpointC:
            json["dewpoint_c"] == null ? null : json["dewpoint_c"].toDouble(),
        dewpointF:
            json["dewpoint_f"] == null ? null : json["dewpoint_f"].toDouble(),
        willItRain: json["will_it_rain"] == null ? null : json["will_it_rain"],
        chanceOfRain:
            json["chance_of_rain"] == null ? null : json["chance_of_rain"],
        willItSnow: json["will_it_snow"] == null ? null : json["will_it_snow"],
        chanceOfSnow:
            json["chance_of_snow"] == null ? null : json["chance_of_snow"],
        visKm: json["vis_km"] == null ? null : json["vis_km"],
        visMiles: json["vis_miles"] == null ? null : json["vis_miles"],
        gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble(),
        gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble(),
        uv: json["uv"] == null ? null : json["uv"],
        airQuality: json["air_quality"] == null
            ? null
            : AirQuality.fromJson(json["air_quality"]),
      );

 }
