import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_cubit.dart';
import 'package:weather_app_bloc/model/load_status.dart';

class CurrentWeatherSmallCard extends StatefulWidget {
  const CurrentWeatherSmallCard({Key? key}) : super(key: key);

  @override
  _CurrentWeatherSmallCard createState() => _CurrentWeatherSmallCard();
}

class _CurrentWeatherSmallCard extends State<CurrentWeatherSmallCard> {
  late final WeatherCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<WeatherCubit>(context);
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
        bloc: _cubit,
        listenWhen: (prev, current) => prev.loadStatus != current.loadStatus,
        listener: (context, state) {},
        buildWhen: (prev, current) => prev.loadStatus != current.loadStatus,
        builder: (context, state) {
          DateTime date = DateTime.now();
          var _day = formatDate(date, [DD]);
          var _date = formatDate(DateTime.now(), [M, ' ', dd]);
          return Row(children: [
            const SizedBox(width: 20),
            state.result?.current?.weather?[0].icon == ""
                ? const SizedBox(
                    height: 160,
                  )
                : CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) {
                      return const SizedBox(
                        width: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    },
                    imageUrl:
                        "https://openweathermap.org/img/wn/${state.result?.current?.weather?[0].icon}@2x.png",
                    fit: BoxFit.cover,
                    height:
                        (state.loadStatus == LoadStatus.SUCCESS) ? 160 : 100,
                    errorWidget: (context, url, error) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(state.loadStatus == LoadStatus.LOADING
                            ? ""
                            : "Error load image!!!"),
                      );
                    },
                  ),
            const SizedBox(width: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_day,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white)),
                    Container(
                        margin: const EdgeInsets.only(left: 11, right: 11),
                        child: Image.asset('assets/images/ic_rect.png')),
                    Text(_date,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '${(state.result?.current?.temp)?.toInt()}°',
                    style: const TextStyle(
                        fontSize: 72.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                   _cubit.toUpperCase(state.result?.current?.weather?[0].description ?? "--"),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ]);
        });
  }
}
