import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

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
              children: const [
                Icon(
                  CupertinoIcons.location_fill,
                  size: 35,
                ),
                Icon(
                  Icons.location_city,
                  size: 35,
                ),
              ],
            ),
            const Text(
              '12° ☔',
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 70,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.start,
            ),
            const Text(
              'Bring a 🧥 just in case in Cupertino!',
              style: TextStyle(
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
