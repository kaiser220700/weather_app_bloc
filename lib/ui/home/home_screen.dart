import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/home/components/current_weather/current_weather.dart';
import 'package:weather_app_bloc/ui/home/components/daily_forecast/daily_forecast.dart';
import 'package:weather_app_bloc/ui/home/components/hourly_forecast/hourly_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _expand
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              CurrentWeather(check: _expand),
              const SizedBox(height: 20.0),
              const HourlyForecast(),
              const SizedBox(height: 20.0),
              _expand
                  ? GestureDetector(
                      child: const DailyForecast(),
                      onTap: () {
                        setState(() {
                          _expand = false;
                        });
                      })
                  : GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Forecast 7 Days',
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xFF0A44E6)),
                          ),
                          Image.asset(
                              'assets/images/ic_arrow-ios-downward-outline.png'),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          _expand = true;
                        });
                      },
                    ),
                    const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
