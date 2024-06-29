import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health/common/widgets/buttons/custom_outlined_button.dart';
import 'package:mental_health/features/personalization/controllers/user_controller.dart';
import 'package:mental_health/features/personalization/screens/profile/change_name_screen.dart';
import 'package:mental_health/features/personalization/screens/profile/change_phone_number_screen.dart';
import 'package:mental_health/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:mental_health/features/personalization/screens/profile/widgets/profile_picture.dart';
import 'package:mental_health/features/personalization/screens/profile/widgets/section_heading.dart';
import 'package:mental_health/utils/formatters/formatter.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              /// Profile picture
              ProfilePicture(controller: controller),

              /// Divider
              const SizedBox(height: 8),
              const Divider(thickness: 3),
              const SizedBox(height: 16),

              /// Heading Profile Info
              const SectionHeading(title: 'Profile Information'),
              const SizedBox(height: 16),

              ProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeNameScreen()),
              ),
              ProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () {},
              ),

              /// Divider
              const SizedBox(height: 16),
              const Divider(thickness: 3),
              const SizedBox(height: 16),

              /// Heading Personal Info
              const SectionHeading(title: 'Personal Information'),
              const SizedBox(height: 16),

              ProfileMenu(
                title: 'User Id',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: 'Email Address',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: Formatter.formatPhoneNumber(
                    controller.user.value.phoneNumber),
                onPressed: () => Get.to(() => const ChangePhoneNumberScreen()),
              ),

              /// Divider
              const SizedBox(height: 16),
              const Divider(thickness: 3),
              const SizedBox(height: 16),

              // Buttons
              CustomOutlinedButton(
                text: 'Delete Account',
                onTap: () => controller.deleteAccountWarningPopup(),
              ),
              const SizedBox(height: 16),
              CustomOutlinedButton(
                text: 'Log out',
                onTap: () => AuthenticationRepository.instance.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
