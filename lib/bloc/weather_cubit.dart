import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/model/load_status.dart';
import 'package:weather_app_bloc/model/responses/weather.dart';
import 'package:weather_app_bloc/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherState());

  void init() async {
    emit(state.copyWith(loadStatus: LoadStatus.LOADING));
    try {
      final result = await weatherRepository.getWeather();
      if (result != null) {
        emit(state.copyWith(result: result, loadStatus: LoadStatus.SUCCESS));
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
      }
    } catch (e) {
      // ignore: avoid_print
      print("LongNH - error: $e");
      emit(state.copyWith(loadStatus: LoadStatus.FAILURE));
    }
  }

  String toUpperCase(String str) {
    var result = str.split('');
    String strResult = "";

    int unitString = str[0].codeUnitAt(0);

    if (String.fromCharCode(unitString) != ' ' && unitString >= 97) {
      result[0] = String.fromCharCode(unitString - 32);
    } 
    for (int i = 0; i < result.length; i++) {
      strResult += result[i];
    }

    return strResult;
  }
}
