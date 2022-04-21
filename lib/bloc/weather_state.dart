part of 'weather_cubit.dart';

// ignore: must_be_immutable
class WeatherState extends Equatable {
  LoadStatus? loadStatus;
  BaseWeather? result;
  WeatherState({
    this.loadStatus,
    this.result,
  });

  WeatherState copyWith({
    LoadStatus? loadStatus,
    BaseWeather? result,
  }) {
    return WeatherState(
      loadStatus: loadStatus ?? this.loadStatus,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [loadStatus, result];
}
