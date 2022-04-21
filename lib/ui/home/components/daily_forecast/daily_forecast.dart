import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_cubit.dart';

import 'daily_forecast_card.dart';

class DailyForecast extends StatefulWidget {
  const DailyForecast({Key? key}) : super(key: key);

  @override
  _DailyForecastState createState() => _DailyForecastState();
}

class _DailyForecastState extends State<DailyForecast> {
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
        height: 470.0,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 15.0, top: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(190, 10, 69, 230), Color(0xFF2C79C1)],
          ),
        ),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: ((context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Forecast for 7 Days',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                const SizedBox(height: 10.0),
                Column(
                  children: List.generate(
                    state.result?.daily?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: DailyForecastCard(
                        dt: state.result?.daily?[index].dt ?? 0,
                        icon: state.result?.daily?[index].weather?[0].icon ?? "",
                        pop: state.result?.daily?[index].pop ?? 0.0,
                        tempMin: state.result?.daily?[index].temp?.min ?? 0.0,
                        tempMax: state.result?.daily?[index].temp?.max ?? 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
