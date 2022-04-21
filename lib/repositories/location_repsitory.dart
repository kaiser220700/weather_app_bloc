import 'package:weather_app_bloc/network/api_client.dart';

import '../model/responses/weather_location.dart';

abstract class LocationRepository {
  Future<WeatherLocation>? getLocation();
}

class LocationRepositoryImpl extends LocationRepository {
  late ApiClient _apiClient;

  LocationRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<WeatherLocation>? getLocation() async {
    return await _apiClient.getLocation();
  }
}