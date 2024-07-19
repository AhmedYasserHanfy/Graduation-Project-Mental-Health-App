import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:test/features/personalization/screens/profile/widgets/profile_picture.dart';
import 'package:test/features/personalization/screens/profile/widgets/section_heading.dart';

import '../../../../common/widgets/buttons/custom_outlined_button.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/formatters/formatter.dart';
import '../../../../utils/popups/loaders.dart';
import '../../controllers/user_controller.dart';
import 'change_name_screen.dart';
import 'change_phone_number_screen.dart';
import 'change_user_name_screen.dart';

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
                onPressed: () => Get.to(() => const ChangeUserNameScreen()),
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
                onPressed: () {
                  final value = ClipboardData(text: controller.user.value.id);
                  Clipboard.setData(value);
                },
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
                onTap: () => Loaders.warningPopup(
                  'Delete Account',
                  'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
                  'Delete',
                  () async => controller.deleteUserAccount(),
                ),
              ),
              const SizedBox(height: 16),
              CustomOutlinedButton(
                text: 'Log out',
                onTap: () => Loaders.warningPopup(
                  'Log out',
                  'Are you sure you want to Logout? You can login again using this account or a different account.',
                  'Log out',
                  () => AuthenticationRepository.instance.logout(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
