import 'package:flutter/material.dart';
import 'package:flutter_weather_app_by_leksidev/screens/location_screen.dart';
import 'package:flutter_weather_app_by_leksidev/services/location.dart';
import 'package:flutter_weather_app_by_leksidev/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'cf56b3288aea7bdbb6432d42b2eaef2f';
const authority = 'api.openweathermap.org';
const path = '/data/2.5/weather';
const lang = 'ru';
const units = 'metric';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longetude;
  late double latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longetude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url: Uri.https(
      authority,
      path,
      {
        'lat': latitude.toString(),
        'lon': longetude.toString(),
        'appid': apiKey,
        'lang': lang,
        'units': units,
      },
    ));

    var weatherData = await networkHelper.getData();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LocationScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
          duration: Duration(milliseconds: 4000),
        ),
      ),
    );
  }
}
