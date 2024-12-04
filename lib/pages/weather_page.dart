import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? cityName;
  WeatherService? ws;
  String? condition;
  double? temperature;
  bool isLoading = true;

  Future<void> userLocation() async {
    try {
      bool servicesEnabled = await Geolocator.isLocationServiceEnabled();
      if (!servicesEnabled) {
        throw Exception("Location services are not enabled");
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Location permission has been denied");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location services have been permanently disabled");
      }

      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      setState(() {
        cityName = placemarks[0].locality;
        ws = WeatherService(city: cityName!);
      });

      // Fetch weather after initializing the WeatherService
      await fetchWeather();
    } catch (e) {
      setState(() {
        isLoading = false;
        condition = "Error: $e";
      });
    }
  }

  Future<void> fetchWeather() async {
    if (ws != null) {
      try {
        final weather = await ws!.fetchWeather();
        setState(() {
          condition = weather['current']['condition']['text'];
          temperature = weather['current']['temp_c'];
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
          condition = "Failed to fetch weather: $e";
        });
      }
    }
  }

  String getAnimation(condition) {
    switch (condition) {
      case "Clear":
      case "Sunny":
        return "assets/clearSky.json";
      case "Cloudy":
      case "Overcast":
        return "assets/cloudy.json";
      case "Partly cloudy":
        return "assets/partlyCloudy.json";
      default:
        return "assets/loading.json";
    }
  }

  @override
  void initState() {
    super.initState();
    userLocation();
  }

  @override
  Widget build(BuildContext context) {
    String animationFiles =
        condition != null ? getAnimation(condition) : "assets/loading.json";
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.blueGrey) // Show a loader while fetching data
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        color: Colors.red,
                      ),
                      Text(
                        cityName ?? "Unknown Location",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (condition != null)
                    Lottie.asset(
                      animationFiles,
                      height: 200,
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (temperature != null)
                    Text(
                      "${temperature!.toStringAsFixed(1)}°C",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  Text(
                    "$condition",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              ),
      ),
    );
  }
}
