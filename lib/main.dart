import 'package:flutter/material.dart';
import 'package:flutter_weather_app_by_LeksiDEV/screens/loading_screen.dart';

void Main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
