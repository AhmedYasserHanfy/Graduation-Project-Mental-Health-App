import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health/features/personalization/controllers/update_user_name_controller.dart';

import '../../../../common/styles/input_field_style.dart';
import '../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/validators/validation.dart';

class ChangeUserNameScreen extends StatelessWidget {
  const ChangeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Username',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              const Text(
                'You can update your username. This name will appear on several pages.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),

              // Animation
              Center(child: Lottie.asset(Images.update, height: 250)),
              const SizedBox(height: 32),

              // Username text field
              Form(
                key: controller.updateUserNameFormKey,
                child: TextFormField(
                  validator: (value) =>
                      Validator.validateEmptyText('Username', value),
                  controller: controller.userName,
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'User Name',
                    Iconsax.user_edit,
                  ),
                  expands: false,
                ),
              ),
              const SizedBox(height: 24),

              // Save button
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Save',
                  textFontSize: 16,
                  onTap: () => controller.updateUserName(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
