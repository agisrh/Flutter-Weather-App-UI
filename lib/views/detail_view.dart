import 'package:flutter/material.dart';
import 'package:weather_app/views/sevenday_view.dart';
import 'package:weather_app/views/tomorrow_view.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: Column(
        children: const [TomorrowView(), SevenDayView()],
      ),
    );
  }
}
