part of 'location_cubit.dart';

// ignore: must_be_immutable
class LocationState extends Equatable {
  LoadStatus? loadStatus;
  WeatherLocation? location;
  LocationState({
    this.loadStatus,
    this.location,
  });

  LocationState copyWith({
    LoadStatus? loadStatus,
    WeatherLocation? location,
  }) {
    return LocationState(
      loadStatus: loadStatus ?? this.loadStatus,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [loadStatus, location];
}
