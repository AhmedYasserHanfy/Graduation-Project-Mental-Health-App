import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health/data/repositories/authentication/authentication_repository.dart';
import 'package:mental_health/data/repositories/user/user_repository.dart';
import 'package:mental_health/features/authentication/screens/login/login.dart';
import 'package:mental_health/features/personalization/models/user_model.dart';
import 'package:mental_health/features/personalization/screens/profile/re_authenticate_user_login_screen.dart';
import 'package:mental_health/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Function to fetch the user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update Rx user and then check if user data is already stored
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first and last names
          final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '',
          );
          final userName = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '',
          );

          // Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'Data not saved.',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }

  // Show a popup message to confirm deleting account
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete user account
  void deleteUserAccount() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'Processing',
        Theme.of(Get.context!).brightness == Brightness.light
            ? Images.lightProcessing
            : Images.darkProcessing,
      );

      // Re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        'Processing',
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
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;
        final imageURL = await userRepository.uploadImage(
          'Users/images/Profile/',
          image,
        );

        Map<String, dynamic> json = {'ProfilePicture': imageURL};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageURL;
        user.refresh();

        Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your profile image has been updated.',
        );
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: 'Oh Snap!',
        message: 'Something went wrong: $e',
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
