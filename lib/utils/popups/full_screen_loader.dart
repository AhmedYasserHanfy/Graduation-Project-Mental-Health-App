import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: Theme.of(Get.context!).brightness == Brightness.light
              ? Colors.white
              : const Color(0xff1B1A1F),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 150),
              AnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() => Navigator.of(Get.overlayContext!).pop();
}
