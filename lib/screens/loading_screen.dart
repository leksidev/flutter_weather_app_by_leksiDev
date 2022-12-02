import 'package:flutter/material.dart';
import 'package:flutter_weather_app_by_leksidev/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    debugPrint(location.latitude.toString());
    debugPrint(location.longitude.toString());
  }

  // if (permission != LocationPermission.denied &&
  //     permission != LocationPermission.deniedForever) {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  // } else {
  //   print('error');
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
