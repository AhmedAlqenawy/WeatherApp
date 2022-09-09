 import 'WeatherModel.dart';

class Day {
  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
    this.airQuality,
  });

  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  AirQuality? airQuality;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC:
            json["maxtemp_c"] == null ? null : json["maxtemp_c"].toDouble(),
        maxtempF:
            json["maxtemp_f"] == null ? null : json["maxtemp_f"].toDouble(),
        mintempC:
            json["mintemp_c"] == null ? null : json["mintemp_c"].toDouble(),
        mintempF:
            json["mintemp_f"] == null ? null : json["mintemp_f"].toDouble(),
        avgtempC:
            json["avgtemp_c"] == null ? null : json["avgtemp_c"].toDouble(),
        avgtempF:
            json["avgtemp_f"] == null ? null : json["avgtemp_f"].toDouble(),
        maxwindMph:
            json["maxwind_mph"] == null ? null : json["maxwind_mph"].toDouble(),
        maxwindKph:
            json["maxwind_kph"] == null ? null : json["maxwind_kph"].toDouble(),
        totalprecipMm:
            json["totalprecip_mm"] == null ? null : json["totalprecip_mm"],
        totalprecipIn:
            json["totalprecip_in"] == null ? null : json["totalprecip_in"],
        avgvisKm: json["avgvis_km"] == null ? null : json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"] == null ? null : json["avgvis_miles"],
        avghumidity: json["avghumidity"] == null ? null : json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"] == null
            ? null
            : json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"] == null
            ? null
            : json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"] == null
            ? null
            : json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"] == null
            ? null
            : json["daily_chance_of_snow"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"] == null ? null : json["uv"],
        airQuality: json["air_quality"] == null
            ? null
            : AirQuality.fromJson(json["air_quality"]),
      );
}
