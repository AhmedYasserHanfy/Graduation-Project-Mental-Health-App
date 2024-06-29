import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/data/repositories/authentication/authentication_repository.dart';
import 'package:mental_health/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:mental_health/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset password Email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'Processing your request...',
        Theme.of(Get.context!).brightness == Brightness.light
            ? Images.lightProcessing
            : Images.darkProcessing,
      );

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Send Email ro reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success screen
      Loaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to reset your password.'.tr,
      );

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();
      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'Processing your request...',
        Theme.of(Get.context!).brightness == Brightness.light
            ? Images.lightProcessing
            : Images.darkProcessing,
      );

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Send Email ro reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success screen
      Loaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to reset your password.'.tr,
      );
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();
      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
