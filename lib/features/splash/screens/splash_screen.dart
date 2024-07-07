import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health/features/splash/controllers/splash_screen_controller.dart';
import 'package:mental_health/utils/constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Name
            const Text(
              'Mental Health',
              style: TextStyle(fontFamily: 'Pacifico', fontSize: 32),
            ),
            const SizedBox(height: 40),

            // Animation Heart
            Lottie.asset(
              Images.heart,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 20),

            // Loading state
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Lottie.asset(Images.loading, width: 150),
              ],
            )
          ],
        ),
      ),
    );
  }
}
