import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_cubit.dart';
import 'package:weather_app_bloc/ui/home/components/current_weather/current_weather_big_card.dart';
import 'package:weather_app_bloc/ui/home/components/current_weather/current_weather_small_card.dart';
import 'package:weather_app_bloc/ui/widget/app_bar/home_app_bar.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key, required this.check}) : super(key: key);

  final bool check;

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
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
      height: widget.check ? 353.0 : 565.0,
      width: 358.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          const HomeAppBar(),
          widget.check
              ? const CurrentWeatherSmallCard()
              : const CurrentWeatherBigCard(),
          BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 5),
                const Divider(
                  height: 40,
                  color: Colors.white,
                  thickness: 1.0,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 45.0, top: 5.0, right: 45.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_paper_plane.png'),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.result?.current?.windSpeed} km/h',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                          const SizedBox(height: 3),
                          const Text('Wind',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white))
                        ],
                      ),
                      const SizedBox(width: 60.0),
                      Image.asset('assets/images/ic_cloud_rain.png'),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${((state.result?.daily?[0].pop ?? 0.0) * 100).toInt()}%",
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                          const SizedBox(height: 3),
                          const Text('Chance of rain',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, top: 30.0, right: 40.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_thermometer.png'),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.result?.current?.pressure} mbar',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                          const SizedBox(height: 3),
                          const Text('Pressure',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white))
                        ],
                      ),
                      const SizedBox(width: 67.0),
                      Stack(children: [
                        Image.asset('assets/images/ic_humidity.png'),
                        Positioned(
                          top: 17.7,
                          left: 9.7,
                          child: Image.asset('assets/images/ic_extra.png'),
                        )
                      ]),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${state.result?.current?.humidity}%',
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.white)),
                          const SizedBox(height: 3),
                          Text('Humidity ${state.result?.current?.humidity}%',
                              style: const TextStyle(
                                  fontSize: 12.0, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
