import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/pages/weather_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          colorScheme: const ColorScheme.dark(surface: Colors.black)),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {'/': (context) => const WeatherPage()},
    );
  }
}
