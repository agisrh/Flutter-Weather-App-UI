import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/config/env.dart';
import 'package:weather_app/core/controller/weather_controller.dart';
import 'package:weather_app/core/functions/string_function.dart';

class SevenDayView extends StatelessWidget {
  const SevenDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherC = Get.put(WeatherController());
    return Expanded(
      child: ListView.builder(
        itemCount: weatherC.weatherData.value!.daily.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  unixToDay(weatherC.weatherData.value!.daily[index].dt),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 135,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(Env.iconURL +
                          weatherC.weatherData.value!.daily[index].weather.first
                              .icon +
                          '.png'),
                      const SizedBox(width: 15),
                      Text(
                        weatherC
                            .weatherData.value!.daily[index].weather.first.main,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "+" +
                          roundTemp(weatherC
                              .weatherData.value!.daily[index].temp.max) +
                          "\u00B0",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "+" +
                          roundTemp(weatherC
                              .weatherData.value!.daily[index].temp.min) +
                          "\u00B0",
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
