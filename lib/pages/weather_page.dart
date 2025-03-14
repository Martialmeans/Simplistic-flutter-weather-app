import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final apiKey = dotenv.env['WEATHER_API_KEY'];
  late WeatherService weatherService;
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
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    weatherService = WeatherService(apiKey);
    // Debug: Print the API key
    debugPrint("API Key: ${dotenv.env['WEATHER_API_KEY']}");
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF05C1FF),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //location pin
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 35,
                        ),
                        //city name
                        Text(
                          weather?.cityName ?? "Loading city...",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    //weather animation
                    Image.network(
                      "https://rodrigokamada.github.io/openweathermap/images/${weather?.icon}_t@4x.png",
                      width: 400,
                      height: 400,
                    ),
                    //weather description
                    Text(
                      weather?.description ?? "Loading weather...",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    //temperature
                    Text(
                      "${weather?.temperature.toInt()}°C",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
