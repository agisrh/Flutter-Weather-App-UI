import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/core/config/env.dart';
import 'package:weather_app/core/functions/string_function.dart';
import 'package:weather_app/core/models/current_model.dart';
import 'package:weather_app/core/models/hourly_model.dart';
import 'package:weather_app/core/services/location_service.dart';
import 'package:weather_app/core/services/weather_service.dart';

class WeatherController extends GetxController {
  LocationService locationService = LocationService();
  WeatherService weatherService = WeatherService();
  Rxn<WeatherData> weatherData = Rxn<WeatherData>();
  RxList<HourlyModel> hourlyList = RxList<HourlyModel>([]);
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var city = "loading".obs;
  var temp = "".obs;
  var main = "".obs;
  var icon = "http://openweathermap.org/img/wn/10d@4x.png".obs;
  var today = "".obs;
  var wind = "0".obs;
  var humidity = "0".obs;
  var rain = "0".obs;
  var loading = false.obs;

  @override
  void onInit() {
    getCurrentLocation();
    requestPermission();
    super.onInit();
  }

  void getCurrentLocation() {
    locationService.locationStream.listen((userLocation) {
      latitude.value = userLocation.latitude;
      longitude.value = userLocation.longitude;

      getWeather(latitude.value.toString(), longitude.value.toString());
    });
  }

  Future<void> requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
  }

  void getWeather(String lat, String long) {
    weatherService.weather(lat: lat, long: long, units: "metric").then((value) {
      weatherData.value = WeatherData.fromJson(value);
      city.value = "";
      main.value = weatherData.value!.current.weather.first.main;
      var iconTemp = weatherData.value!.current.weather.first.icon;
      icon.value = Env.iconURL + iconTemp + '@4x.png';
      var temprature = weatherData.value!.current.temp;
      temp.value = double.parse(temprature).toStringAsFixed(0);
      today.value = DateFormat.MMMMEEEEd().format(DateTime.now());
      wind.value = roundTemp(weatherData.value!.current.windSpeed.toString());
      humidity.value =
          roundTemp(weatherData.value!.current.humidity.toString());
      rain.value = roundTemp(weatherData.value!.current.windGust.toString());
      hourlyList.value = HourlyModel.fromJsonList(weatherData.value!.hourly);
    });
  }
}
