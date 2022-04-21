import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_cubit.dart';

import 'hourly_forecast_card.dart';

class HourlyForecast extends StatefulWidget {
  const HourlyForecast({Key? key}) : super(key: key);

  @override
  _HourlyForecastState createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  late final WeatherCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<WeatherCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15.0, top: 11.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(190, 10, 69, 230), Color(0xFF2C79C1)],
        ),
      ),
      child: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          DateTime date = DateTime.now();
          var _dayOfWeek = formatDate(date, [DD]);
          var _date = formatDate(DateTime.now(), [M, ' ', dd]);
          return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(_dayOfWeek,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white)),
                Container(
                    margin: const EdgeInsets.only(left: 11, right: 11),
                    child: Image.asset('assets/images/ic_rect.png')),
                Text(_date,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  state.result?.hourly?.length ?? 0,
                  (index) => Center(
                    child: HourlyForecastCard(
                      dt: state.result?.hourly?[index].dt ?? 0,
                      icon: state.result?.hourly?[index].weather?[0].icon ?? "",
                      temp: state.result?.hourly?[index].temp ?? 0,
                      feelsLike: state.result?.hourly?[index].feelsLike ?? 0,
                      pop: state.result?.hourly?[index].pop ?? 0.0,
                      index: index,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
        }
      ),
    );
  }
}
