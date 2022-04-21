import 'package:weather_app_bloc/model/responses/weather.dart';
import 'package:weather_app_bloc/network/api_client.dart';

abstract class WeatherRepository {
  Future<BaseWeather>? getWeather();
}

class WeatherRepositoryImpl extends WeatherRepository {
  late ApiClient _apiClient;

  WeatherRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<BaseWeather>? getWeather() async {
    return await _apiClient.getWeather();
  }
}