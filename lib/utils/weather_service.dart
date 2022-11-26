import 'dart:convert';

import 'package:http/http.dart';

import 'package:geolocator/geolocator.dart';

class WeatherService {
  static const String baseUrl =
      "https://api.openweathermap.org/data/2.5/weather?";
  static const String apiKey = "2a3990f7f2569d83b8d2d70f898cb6af";

  static Future getWeatherForLocation(Position position) async {
    String url =
        "${baseUrl}lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Unable to fetch data');
    }
  }
}
