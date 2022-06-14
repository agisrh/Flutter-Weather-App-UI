import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/config/env.dart';
import 'package:weather_app/core/functions/string_function.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';
import 'package:weather_app/core/controller/weather_controller.dart';

class TomorrowView extends StatelessWidget {
  const TomorrowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherC = Get.put(WeatherController());
    return GlowContainer(
      color: const Color(0xff00A1FF),
      glowColor: const Color(0xff00A1FF),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 30,
              left: 30,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      "7 days",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(Env.iconURL +
                          weatherC
                              .weatherData.value!.daily[1].weather.first.icon +
                          '@4x.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Tomorrow",
                      style: TextStyle(
                        fontSize: 25,
                        height: 0.1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            roundTemp(weatherC
                                    .weatherData.value!.daily[1].temp.max) +
                                "\u00B0",
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "/" +
                                roundTemp(weatherC
                                    .weatherData.value!.daily[1].temp.min) +
                                "\u00B0",
                            style: TextStyle(
                              color: Colors.black54.withOpacity(0.3),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      weatherC.weatherData.value!.daily[1].weather.first.main,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              right: 50,
              left: 50,
            ),
            child: Column(
              children: [
                const Divider(color: Colors.white),
                const SizedBox(height: 10),
                ExtraWeather(
                  wind:
                      roundTemp(weatherC.weatherData.value!.daily[1].windSpeed),
                  humadity:
                      roundTemp(weatherC.weatherData.value!.daily[1].humidity),
                  rain: weatherC.weatherData.value!.daily[1].rain,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
