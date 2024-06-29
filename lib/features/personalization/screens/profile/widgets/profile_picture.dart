import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../app/screens/home/screens/home_screen.dart';
import '../../../controllers/user_controller.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =
              networkImage.isNotEmpty ? networkImage : Images.maleDoctor;

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
          onPressed: () => controller.uploadUserProfilePicture(),
          child: const Text(
            'Change Profile Picture',
            style: TextStyle(fontSize: 13, color: Color(0xFF6AAFE6)),
          ),
        ),
      ],
    );
  }
}
