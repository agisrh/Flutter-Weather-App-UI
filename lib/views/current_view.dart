import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:weather_app/ui/utils/screens.dart';
import 'package:weather_app/core/controller/weather_controller.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class CurrentView extends StatelessWidget {
  const CurrentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherC = Get.put(WeatherController());
    return GlowContainer(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      glowColor: const Color(0xff00A1FF).withOpacity(0.5),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      color: const Color(0xff00A1FF),
      spreadRadius: 5,
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: Colors.white,
                ),
                Row(
                  children: const [
                    Icon(CupertinoIcons.map_fill, color: Colors.white),
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
            Column(
              children: [
                Image.network(weatherC.icon.value),
                const SizedBox(height: 80),
                GlowText(
                  weatherC.temp.value + "\u00B0",
                  style: const TextStyle(
                    height: 0.1,
                    fontSize: 150,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                  child: Text(
                    weatherC.main.value,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  weatherC.today.value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.white),
            ExtraWeather(
              wind: weatherC.wind.value,
              humadity: weatherC.humidity.value,
              rain: weatherC.rain.value,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
