import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/circular_image.dart';
import '../../../../common/widgets/loaders/shimmer_effect.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../../personalization/screens/profile/profile_screen.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return GestureDetector(
      onTap: () => Get.to(() => const ProfileScreen()),
      child: Obx(() {
        final networkImage = userController.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : Images.doctor;

        return userController.imageUploading.value
            ? const ShimmerEffect(width: 55, height: 55, radius: 55)
            : CircularImage(
                image: image,
                width: 55,
                height: 55,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
    );
  }
}
