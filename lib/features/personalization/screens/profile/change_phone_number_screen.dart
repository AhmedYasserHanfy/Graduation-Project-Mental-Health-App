import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/styles/input_field_style.dart';
import '../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/update_phone_number_controller.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Phone Number',
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
                'You can update your phone number. Please enter your new phone number.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),

              // Animation
              Center(child: Lottie.asset(Images.update, height: 250)),
              const SizedBox(height: 32),

              // Phone text field
              Form(
                key: controller.updatePhoneNumberFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneNumber,
                  validator: (value) => Validator.validatePhoneNumber(value),
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'Phone',
                    Icons.phone,
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
                  onTap: () => controller.updateUserPhoneNumber(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
