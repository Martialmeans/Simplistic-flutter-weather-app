import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherService = WeatherService("d24ee592f5931d924e538f731be9a7e4");
  WeatherModel? weather;
  bool isLoading = true;

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
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //city name
                  Text(weather?.cityName ?? "Loading city..."),
                  //weather animation
                  Image.network(
                    "https://rodrigokamada.github.io/openweathermap/images/${weather?.icon}_t@4x.png",
                    width: 100,
                    height: 100,
                  ),
                  //weather description
                  Text(weather?.description ?? "Loading weather..."),
                  //temperature
                  Text("${weather?.temperature.toInt()}°C"),
                ],
              ),
      ),
    );
  }
}
