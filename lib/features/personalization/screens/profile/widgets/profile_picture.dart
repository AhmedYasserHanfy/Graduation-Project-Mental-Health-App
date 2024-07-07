import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/widgets/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../common/widgets/loaders/shimmer_effect.dart';
import '../../../controllers/user_controller.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.controller,
  });

  final UserController controller;

  void showImagePickerOption() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: MediaQuery.of(Get.context!).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      controller.uploadUserProfilePicture(ImageSource.gallery);
                      Navigator.of(Get.context!).pop();
                    },
                    child: const Text(
                      'Gallery',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      controller.uploadUserProfilePicture(ImageSource.camera);
                      Navigator.of(Get.context!).pop();
                    },
                    child: const Text('Camera', style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(Get.context!).pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : Images.doctor;

          return controller.imageUploading.value
              ? const ShimmerEffect(width: 200, height: 200, radius: 200)
              : CircularImage(
                  // backgroundColor: Colors.white,
                  image: image,
                  width: 220,
                  height: 220,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        }),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => showImagePickerOption(),
          child: const Text(
            'Change Profile Picture',
            style: TextStyle(fontSize: 13, color: Color(0xFF6AAFE6)),
          ),
        ),
      ],
    );
  }
}
