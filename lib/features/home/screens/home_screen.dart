import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/features/home/controllers/home_screen_controller.dart';
import 'package:mental_health/features/drawer/widgets/drawer.dart';
import 'package:mental_health/features/home/screens/widgets/user_profile_avatar.dart';
import 'package:mental_health/utils/constants/image_strings.dart';

import '../../../common/widgets/buttons/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Mental Health',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        actions: const [UserProfileAvatar()],
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
                child: Image.asset(Images.uploadIcon, height: 124),
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
