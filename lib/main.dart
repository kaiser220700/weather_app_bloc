import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/location_cubit.dart';
import 'package:weather_app_bloc/bloc/weather_cubit.dart';
import 'package:weather_app_bloc/network/api_client.dart';
import 'package:weather_app_bloc/network/api_util.dart';
import 'package:weather_app_bloc/repositories/location_repsitory.dart';
import 'package:weather_app_bloc/repositories/weather_repository.dart';
import 'package:weather_app_bloc/ui/home/home_screen.dart';

void main() {
  late final ApiClient _apiClient;
  _apiClient = ApiUtil.instance.apiClient;
  runApp(
    MultiRepositoryProvider(
        providers: [
          RepositoryProvider<WeatherRepository>(create: (context) {
            return WeatherRepositoryImpl(_apiClient);
          }),
          RepositoryProvider<LocationRepository>(create: (context) {
            return LocationRepositoryImpl(_apiClient);
          })
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<WeatherCubit>(create: (context) {
              final repository =
                  RepositoryProvider.of<WeatherRepository>(context);
              return WeatherCubit(repository);
            }),
            BlocProvider<LocationCubit>(create: (context) {
              final repositoryLocation =
                  RepositoryProvider.of<LocationRepository>(context);
              return LocationCubit(repositoryLocation);
            }),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        )),
  );
}
