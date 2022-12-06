import 'package:flutter/material.dart';
import 'package:flutter_weather_app_by_leksidev/services/location.dart';
import 'package:flutter_weather_app_by_leksidev/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiKey = env['apiKey'];
const authority = 'api.openweathermap.org';
const path = '/data/2.5/weather';
const lang = 'ru';
const units = 'metric';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      url: Uri.https(
        authority,
        path,
        {
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
          'appid': apiKey,
          'lang': lang,
          'units': units,
        },
      ),
    );

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icons.thunderstorm;
    } else if (condition < 400) {
      return Icons.cloudy_snowing;
    } else if (condition < 600) {
      return Icons.umbrella;
    } else if (condition < 700) {
      return Icons.ac_unit;
    } else if (condition < 800) {
      return Icons.foggy;
    } else if (condition == 800) {
      return Icons.sunny;
    } else if (condition <= 804) {
      return Icons.cloud;
    } else {
      return Icons.warning;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Самое время для 🍦 ';
    } else if (temp > 20) {
      return 'Можно смело надевать шорты и 👕';
    } else if (temp < 10) {
      return 'Не забудьте надеть 🧣 и 🧤';
    } else {
      return 'Не помешает надеть 🧥 ';
    }
  }
}
