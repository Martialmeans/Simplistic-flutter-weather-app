# Weather App

A simple weather app that provides real-time weather information and forecast based on the user's location or a selected city. The app also features a user-friendly interface with a dynamic and interactive weather animation.

## Features

- Current weather data: Displays the current temperature, weather condition (e.g., clear, cloudy, rainy), and an appropriate weather animation.
- Location-based weather: The app detects the user's current location and fetches weather data for that area.
- Custom weather animation: Animated weather icons that change based on weather conditions, providing a more engaging experience.
- Permission handling: The app asks for location permissions from the user with options for precise or approximate location access.

## Screenshots

![Simplistic-flutter-weather-app](assets/app_design_layout.gif)

Example of the weather display screen, including the current temperature and conditions.

## Requirements

- Flutter SDK: Download Flutter
- Dart: Included with Flutter SDK.
- API key from OpenWeatherMap, or any other weather API provider.

## Installation

Clone the repository:

```bash
    git clone https://github.com/yourusername/weather_app.git
    Navigate to the project directory:
```

```bash
    cd weather_app
    Install dependencies:
```

```bash
    flutter pub get
    Run the app:
```

```bash
    flutter run
```

## API Integration

This app uses the WeatherApi to fetch weather data. You will need an API key to use it.

- Sign up for an API key at WeatherApi.
- Add your API key in the lib/services/weather_service.dart file.
- dart
- Copy code
- final String apiKey = 'YOUR_API_KEY_HERE';

## Packages Used
This project makes use of the following Flutter packages:

```bash
dependencies:
  flutter:
    sdk: flutter
  font_awesome_flutter: ^10.8.0
  geocoding: ^3.0.0
  geolocator: ^13.0.2
  google_fonts: ^6.2.1
  http: ^1.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
```

Make sure to add these dependencies in your pubspec.yaml file.

## Features to Implement

- Forecast for multiple days: Show hourly or daily weather forecast.
- Customizable units: Allow the user to switch between Celsius and Fahrenheit.
- Widgets for quick glance: Display a widget with current weather on the home screen.

## Contributing
If you'd like to contribute to the project, feel free to fork the repo and submit a pull request. Ensure that your code follows the app's existing style and conventions.

- Fork the repository.
- Create a new branch for your feature or bug fix.
- Commit your changes.
- Open a pull request.


## Acknowledgements
- <a href="https://www.weatherapi.com/" target="_blank" rel="noopener noreferrer">WeatherApi</a> for providing the weather API.
- <a href="https://www.flaticon.com/" target="_blank" rel="noopener noreferrer">Flaticons</a> for the interactive weather animations.
- <a href="https://flutter.dev/" target="_blank" rel="noopener noreferrer">Flutter</a> for building the app.
