import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherService = WeatherService("Enter your api key here");
  WeatherModel? weather;
  bool isLoading = true;
  String? localTime;

  // fetchWeather
  void _fetchWeather() async {
    // get user city name
    String cityName = await weatherService.getUserLocation();
    try {
      // get weather data
      WeatherModel weatherData = await weatherService.getWeather(cityName);
      setState(() {
        weather = weatherData;
        isLoading = false;
        localTime = weatherService.displayTime();
      });
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0061A4),
              Color(0xFFB9EAFF),
            ],
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //city name
                    Text(
                      weather?.cityName ?? "Loading city...",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    //weather animation
                    Image.network(
                      "https://rodrigokamada.github.io/openweathermap/images/${weather?.icon}_t@4x.png",
                      width: 100,
                      height: 100,
                    ),
                    //weather description
                    Text(
                      weather?.description ?? "Loading weather...",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    //temperature
                    Text(
                      "${weather?.temperature.toInt()}°C",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Last updated: $localTime",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
