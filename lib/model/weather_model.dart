class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      condition: json['weather'][0]['main'],
    );
  }
}
