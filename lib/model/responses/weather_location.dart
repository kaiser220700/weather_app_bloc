import 'package:json_annotation/json_annotation.dart';

part 'weather_location.g.dart';

@JsonSerializable()
class WeatherLocation {
  String? name;

  WeatherLocation({
    this.name
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) => _$WeatherLocationFromJson(json);
}