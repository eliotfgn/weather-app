import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/weather_service.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData weatherData;
  const LocationScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.location_fill,
                  size: 35,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.location_city,
                    size: 35,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${widget.weatherData.temp.toInt().toString()}°',
                  style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 70,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.start,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https:${widget.weatherData.conditionIconUrl}'),
                          fit: BoxFit.fill)),
                )
              ],
            ),
            Text(
              '${widget.weatherData.getMessage()} ${widget.weatherData.location}!',
              style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
