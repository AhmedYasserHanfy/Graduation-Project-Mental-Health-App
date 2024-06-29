import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mental_health/data/repositories/authentication/authentication_repository.dart';
import 'package:mental_health/data/repositories/user/user_repository.dart';
import 'package:mental_health/features/authentication/screens/signup/verify_email.dart';
import 'package:mental_health/features/personalization/models/user_model.dart';
import 'package:mental_health/utils/constants/image_strings.dart';
import 'package:mental_health/utils/popups/full_screen_loader.dart';
import 'package:mental_health/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'We are processing your information',
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
      if (!signupFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save authenticated user data in the Firebase FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );

      // Move to verify Email Success
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
