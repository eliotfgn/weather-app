import 'dart:convert';

import 'package:http/http.dart';

import 'package:geolocator/geolocator.dart';

class WeatherService {
  static const String baseUrl =
      "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=";
  static const String apiKey = "37e9b5bcd2ba423fa7f192858222611";

  static Future getWeatherForLocation(Position position) async {
    String url = "$baseUrl${position.latitude},${position.longitude}";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Unable to fetch data');
    }
  }

  static WeatherData getWeatherData(data) {
    String location = data['location']['name'];
    double temp = data['current']['temp_c'];
    String conditionIconUrl = data['current']['condition']['icon'];

    return WeatherData(
        location: location, temp: temp, conditionIconUrl: conditionIconUrl);
  }
}

class WeatherData {
  String location;
  double temp;
  String conditionIconUrl;

  WeatherData(
      {required this.location,
      required this.temp,
      required this.conditionIconUrl});

  String getMessage() {
    if (temp > 25) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case in';
    }
  }
}
