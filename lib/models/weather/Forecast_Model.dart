import 'Day_model.dart';
import 'Hour_model.dart';
import 'WeatherModel.dart';

class Forecast {
  Forecast({
    this.forecastday,
  });

  List<Forecastday>? forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? null
            : List<Forecastday>.from(
                json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );
}

class Forecastday {
  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"] == null ? null : json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? null
            : List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );
}
