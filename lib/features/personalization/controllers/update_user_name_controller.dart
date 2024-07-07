import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile_screen.dart';

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();

  /// Variables
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final userName = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when home screen appears
  @override
  void onInit() {
    initializeUserName();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeUserName() async {
    userName.text = userController.user.value.userName;
  }

  Future<void> updateUserName() async {
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
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Update user's First & Last name in the Firebase Firestore
      Map<String, dynamic> username = {'Username': userName.text.trim()};
      await userRepository.updateSingleField(username);

      // Update the Rx user values
      userController.user.value.userName = userName.text.trim();

      // Remove loader
      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your username has been updated.',
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
