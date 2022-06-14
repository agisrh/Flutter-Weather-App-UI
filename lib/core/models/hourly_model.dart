class HourlyModel {
  HourlyModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });
  late final String dt;
  late final String temp;
  late final String feelsLike;
  late final String pressure;
  late final String humidity;
  late final String dewPoint;
  late final String uvi;
  late final String clouds;
  late final String visibility;
  late final String windSpeed;
  late final String windDeg;
  late final String windGust;
  late final List<Weather> weather;
  late final String pop;

  HourlyModel.fromJson(Map<String, dynamic> json) {
    dt = json['dt'].toString();
    temp = json['temp'].toString();
    feelsLike = json['feels_like'].toString();
    pressure = json['pressure'].toString();
    humidity = json['humidity'].toString();
    dewPoint = json['dew_point'].toString();
    uvi = json['uvi'].toString();
    clouds = json['clouds'].toString();
    visibility = json['visibility'].toString();
    windSpeed = json['wind_speed'].toString();
    windDeg = json['wind_deg'].toString();
    windGust = json['wind_gust'].toString();
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    pop = json['pop'].toString();
  }

  static List<HourlyModel> fromJsonList(List list) {
    return list.map((item) => HourlyModel.fromJson(item)).toList();
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final String id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    main = json['main'].toString();
    description = json['description'].toString();
    icon = json['icon'].toString();
  }
}
