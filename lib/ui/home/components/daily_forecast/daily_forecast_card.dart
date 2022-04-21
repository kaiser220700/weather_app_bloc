import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  const DailyForecastCard({
    Key? key,
    required this.dt,
    required this.icon,
    required this.pop,
    required this.tempMin,
    required this.tempMax,
  }) : super(key: key);
  final String icon;
  final num tempMin, tempMax, pop;
  final int dt;

  @override
  Widget build(BuildContext context) {
    var time = formatDate(DateTime.fromMillisecondsSinceEpoch(dt * 1000), [D]);
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.0,
            child: Text(
              time,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          const SizedBox(width: 100.0),
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
          const SizedBox(width: 5.0),
          SizedBox(
            width: 60.0,
            child: Text(
              "${(pop*100).toInt()}% rain",
              style: const TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
          const SizedBox(width: 80.0),
          Text(
            "${tempMin.toInt()}°",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          const Text(
            '/',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Text(
            "${tempMax.toInt()}°",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          const SizedBox(height: 3.0),
        ],
      ),
    );
  }
}
