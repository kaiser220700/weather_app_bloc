import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/model/load_status.dart';
import 'package:weather_app_bloc/repositories/location_repsitory.dart';

import '../model/responses/weather_location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationRepository locationRepository;

  LocationCubit(this.locationRepository) : super(LocationState());

  void init() async {
    emit(state.copyWith(loadStatus: LoadStatus.LOADING));
    try {
      final location = await locationRepository.getLocation();
      if (location != null) {
        emit(state.copyWith(location: location, loadStatus: LoadStatus.SUCCESS));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
      }
    } catch (e) {
      // ignore: avoid_print
      print("LongNH - error: $e");
      emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
    }
  }
  
}