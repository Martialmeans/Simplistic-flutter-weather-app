import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class WeatherService {
  final String city;
  final String apiKey = "03923c392b1442c09b6182440240212";

  WeatherService({required this.city});

  Future<Map<String, dynamic>> fetchWeather() async {
    final String url =
        "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Could not load weather data");
      }
    } catch (e) {
      debugPrint("$e");
      return {};
    }
  }
}
