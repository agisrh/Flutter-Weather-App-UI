import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/controller/splash_controller.dart';
import 'package:weather_app/core/controller/weather_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _init();
    });
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.put(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Color(0xff00A1FF)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: 'Logo',
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 120.0,
                          child: Image.asset('assets/images/weather-logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
