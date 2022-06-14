import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/config/env.dart';

class WeatherWidget extends StatelessWidget {
  final String main;
  final String time;
  final String icon;
  WeatherWidget({required this.time, required this.icon, required this.main});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Text(
            main + "\u00B0",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Image(
            image: NetworkImage(Env.iconURL + icon + '.png'),
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class ExtraWeather extends StatelessWidget {
  final String wind;
  final String humadity;
  final String rain;
  ExtraWeather({
    required this.wind,
    required this.rain,
    required this.humadity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              wind + " Km/h",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Wind",
              style: TextStyle(color: Colors.white38, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              humadity + " %",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Humidity",
              style: TextStyle(color: Colors.white38, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              rain + " %",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Rain",
              style: TextStyle(color: Colors.white38, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
