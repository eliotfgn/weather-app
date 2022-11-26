import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/pages/location_screen.dart';
import 'package:weather_app/utils/weather_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getPosition();
  }

  void getPosition() async {
    Position position;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Geolocator.getCurrentPosition().then((value) {
        position = value;
        WeatherService.getWeatherForLocation(position).then((value) =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LocationScreen())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: SpinKitRipple(
          color: Colors.red,
          size: 100,
        ),
      ),
    );
  }
}
