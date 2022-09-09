class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] ,
        region: json["region"]  ,
        country: json["country"]  ,
        lat: json["lat"] ,
        lon: json["lon"]  ,
        tzId: json["tz_id"]  ,
        localtimeEpoch:
            json["localtime_epoch"]  ,
        localtime: json["localtime"]  ,
      );

 }
