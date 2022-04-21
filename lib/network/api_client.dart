import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app_bloc/model/responses/weather.dart';

import '../model/responses/weather_location.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5")
abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/onecall?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric&exclude=minutely')
  Future<BaseWeather> getWeather();

  @GET ('/weather?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric')
  Future<WeatherLocation> getLocation();
}