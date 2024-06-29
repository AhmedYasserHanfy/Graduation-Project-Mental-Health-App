import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/close_app.dart';
import '../../home/screens/home_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Get.offAll(() => const CloseApp(screen: HomeScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }
}
