import 'package:get/get.dart';
import 'package:weather_app/views/detail_view.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/splash_view.dart';

class Routes {
  static const String root = '/';
  static const String home = '/home';
  static const String detail = '/detail';
}

final List<GetPage> routes = [
  GetPage(name: Routes.root, page: () => const SplashView()),
  GetPage(name: Routes.home, page: () => const HomeView()),
  GetPage(name: Routes.detail, page: () => const DetailView()),
];
