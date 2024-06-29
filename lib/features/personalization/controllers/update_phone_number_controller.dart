import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile_screen.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();

  /// Variables
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> updatePhoneNumberFormKey = GlobalKey<FormState>();

  /// Init user data when home screen appears
  @override
  void onInit() {
    initializePhoneNumber();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializePhoneNumber() async {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> updateUserPhoneNumber() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'We are updating your information',
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
      if (!updatePhoneNumberFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Update user's First & Last name in the Firebase Firestore
      Map<String, dynamic> phone = {'PhoneNumber': phoneNumber.text.trim()};
      await userRepository.updateSingleField(phone);

      // Update the Rx user values
      userController.user.value.phoneNumber = phoneNumber.text.trim();

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your phone number has been updated.',
      );

      // Move to previous screen
      Navigator.of(Get.overlayContext!).pop();
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
