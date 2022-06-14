import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    requestPermission();
    super.onInit();
  }

  // Request Permission
  Future<void> requestPermission() async {
    await [
      Permission.location,
    ].request();
    var status = await Permission.location.status;
    if (status.isGranted) {
      Get.offAllNamed('/home');
    } else {
      requestPermission();
    }
  }
}
