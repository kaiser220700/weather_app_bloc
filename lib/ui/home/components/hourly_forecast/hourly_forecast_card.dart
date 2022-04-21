import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    Key? key,
    required this.dt,
    required this.icon,
    required this.temp,
    required this.feelsLike,
    required this.pop,
    required this.index,
  }) : super(key: key);
  final String icon;
  final num temp, feelsLike, pop;
  final int dt, index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 75,
      margin: const EdgeInsets.only(left: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            String time = "";
            if (index == 0) {
              time = "Now";
            } else {
              time = formatDate(
            DateTime.fromMillisecondsSinceEpoch(dt * 1000), [HH, ":", nn]);
            }
            return Text(
              time,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            );
          }),
          const SizedBox(height: 3.0),
          icon == ""
              ? const SizedBox()
              : CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) {
                    return const SizedBox(
                      width: 100,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    );
                  },
                  imageUrl: "https://openweathermap.org/img/wn/$icon@2x.png",
                  fit: BoxFit.cover,
                  height: 35.0,
                  width: 35.0,
                ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temp.toInt()}°",
                style: const TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              const Text(
                '/',
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              Text(
                "${feelsLike.toInt()}°",
                style: const TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            "${(pop * 100).toInt()}% rain",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
