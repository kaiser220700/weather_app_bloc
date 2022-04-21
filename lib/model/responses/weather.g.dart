// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseWeather _$BaseWeatherFromJson(Map<String, dynamic> json) => BaseWeather(
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => Hourly.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      temp: (json['temp'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      dt: json['dt'] as int?,
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );
