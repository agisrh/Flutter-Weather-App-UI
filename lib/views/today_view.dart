import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/controller/weather_controller.dart';
import 'package:weather_app/core/functions/string_function.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class TodayView extends StatelessWidget {
  const TodayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherC = Get.put(WeatherController());
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/detail');
                },
                child: Row(
                  children: const [
                    Text(
                      "7 days ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weatherC.hourlyList.length,
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: WeatherWidget(
                        main: roundTemp(weatherC.hourlyList[i].temp),
                        time: unixToTime(weatherC.hourlyList[i].dt),
                        icon: weatherC.hourlyList[i].weather.first.icon,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
