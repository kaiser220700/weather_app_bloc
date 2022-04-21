import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class BaseWeather {
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  BaseWeather({
    this.current,
    this.hourly,
    this.daily,
  });

  factory BaseWeather.fromJson(Map<String, dynamic> json) => _$BaseWeatherFromJson(json);
}

@JsonSerializable()
class Current {
  double? temp;
  int? pressure;
  int? humidity;

  @JsonKey(name: "wind_speed")
  double? windSpeed;

  List<Weather>? weather;
  double? pop;

  Current({
    this.temp,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.weather,
    this.pop,
  });
  
factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@JsonSerializable()
class Hourly {
  int? dt;
  double? temp;

  @JsonKey(name: "feels_like")
  double? feelsLike;

  List<Weather>? weather;
  double? pop;
  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.weather,
    this.pop,
  });
  
  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

@JsonSerializable()
class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  double? pop;
  Daily({
    this.dt,
    this.temp,
    this.weather,
    this.pop,
  });
  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}

@JsonSerializable()
class Weather {
  String? description;
  String? icon;
  Weather({
    this.description,
    this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@JsonSerializable()
class Temp {
  double? min;
  double? max;
  Temp({
    this.min,
    this.max,
  });
  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}
