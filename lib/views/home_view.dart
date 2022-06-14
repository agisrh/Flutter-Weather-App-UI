import 'package:flutter/material.dart';
import 'package:weather_app/views/current_view.dart';
import 'package:weather_app/views/today_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: SingleChildScrollView(
        child: Column(
          children: const [CurrentView(), TodayView()],
        ),
      ),
    );
  }
}
