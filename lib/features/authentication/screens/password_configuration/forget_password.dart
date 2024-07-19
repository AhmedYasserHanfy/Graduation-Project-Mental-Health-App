import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/styles/input_field_style.dart';
import '../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              const Text(
                'Forget password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 64),

              Lottie.asset(Images.forgetPassword),
              const SizedBox(height: 64),

              /// Text Field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.email,
                  validator: Validator.validateEmail,
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'Email',
                    Icons.email,
                  ),
                  expands: false,
                ),
              ),
              const SizedBox(height: 32),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Submit',
                  textFontSize: 16,
                  onTap: () => controller.sendPasswordResetEmail(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
