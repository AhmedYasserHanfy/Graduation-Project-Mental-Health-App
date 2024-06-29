import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/features/app/screens/home/controllers/home_screen_controller.dart';
import 'package:mental_health/features/app/screens/home/screens/widgets/drawer.dart';
import 'package:mental_health/features/personalization/controllers/user_controller.dart';
import 'package:mental_health/features/personalization/screens/profile/profile_screen.dart';
import 'package:mental_health/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../../common/widgets/circular_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    final userController = Get.put(UserController());
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Mental Health',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const ProfileScreen()),
            child: Obx(() {
              final networkImage = userController.user.value.profilePicture;
              final image =
                  networkImage.isNotEmpty ? networkImage : Images.maleDoctor;

              return userController.imageUploading.value
                  ? const ShimmerEffect(width: 55, height: 55, radius: 55)
                  : CircularImage(
                      image: image,
                      width: 55,
                      height: 55,
                      isNetworkImage: networkImage.isNotEmpty,
                    );
            }),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// App Logo
              SizedBox(
                width: 300,
                height: 250,
                child: Image.asset(Images.appLogo),
              ),
              const SizedBox(height: 50),

              // Title
              const Text(
                'Upload Patient\'s Audio File',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),

              // Upload Icon
              InkWell(
                child: Image.asset(Images.uploadLogo, height: 124),
                onTap: () => controller.pickAudioFile(),
              ),
              const SizedBox(height: 60),

              // Analyze Button
              CustomElevatedButton(
                text: 'Analyze the file',
                textFontSize: 20,
                onTap: () => controller.analyzeAudioFile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? const Color(0xFF4F4F4F) : Colors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
