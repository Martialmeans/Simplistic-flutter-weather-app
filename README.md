# Weather App

A simple weather app that provides current weather information based on the user's location. The app also features a user-friendly interface.

## Features

- Current weather data: Displays the current temperature, weather condition (e.g., clear, cloudy, rainy), and an appropriate weather icon.
- Location-based weather: The app detects the user's current location and fetches weather data for that area.
- Permission handling: The app asks for location permissions from the user with options for precise or approximate location access.

## Screenshots



Example of the weather display screen, including the current temperature and conditions.

## Requirements

- Flutter SDK: Download Flutter
- Dart: Included with Flutter SDK.
- API key from <a href="https://openweathermap.org/" target="_blank" rel="noopener noreferrer">Openweathermap</a>.

## Installation

Clone the repository:

```
    git clone https://github.com/Martialmeans/Simplistic-flutter-weather-app.git
```
Navigate to the project directory:

```
    cd Simplistic-flutter-weather-app
```
Install dependencies:

```
    flutter pub get
```
Run the app:

```
    flutter run
```

## API Integration

This app uses the Openweathermap to fetch weather data. You will need an API key to use it.

- Sign up for an API key at Openweathermap.
- Add your API key in a .env file.
- dart
- Copy code
- final String apiKey = 'YOUR_API_KEY_HERE'; in Simplistic-flutter-weather-app/lib/pages/weather_page.dart

## Packages Used
This project makes use of the following Flutter packages:

```
  dependencies:
  flutter:
    sdk: flutter
  flutter_dotenv: ^5.2.1
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

## Acknowledgements
- <a href="https://openweathermap.org/" target="_blank" rel="noopener noreferrer">Openweathermap</a> for providing the weather data.
- <a href="https://github.com/rodrigokamada/openweathermap" target="_blank" rel="noopener noreferrer">@Rodrigo Kamada</a> for the weather icons.
- <a href="https://flutter.dev/" target="_blank" rel="noopener noreferrer">Flutter</a> for building the app.
