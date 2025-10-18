import 'package:flutter/material.dart';
import 'package:estreaming/pages/accueil.dart';
//import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Color(0xFFB8860B), // amber sombre (#B8860B)
  //     statusBarIconBrightness: Brightness.light, // icônes claires
  //   ),
  // );
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eStreaming',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 85, 65, 5),
        applyElevationOverlayColor: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 85, 65, 5),
        ),
        useMaterial3: true,
      ),
      home: MapremierePage(),
    );
  }
}
