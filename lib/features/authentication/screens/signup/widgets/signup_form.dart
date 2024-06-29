import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health/utils/validators/validation.dart';

import '../../../../../common/styles/input_field_style.dart';
import '../../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../controllers/signup/signup_controller.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last name
          Row(
            children: [
              /// First name
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller.firstName,
                  validator: (value) =>
                      Validator.validateEmptyText('First name', value),
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'First Name',
                    Iconsax.user,
                  ),
                  expands: false,
                ),
              ),
              const SizedBox(width: 16),

              /// Last name
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller.lastName,
                  validator: (value) =>
                      Validator.validateEmptyText('Last name', value),
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'Last Name',
                    Iconsax.user,
                  ),
                  expands: false,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          /// User name
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                Validator.validateEmptyText('Username', value),
            decoration: InputFieldStyle.inputFieldStyle(
              context,
              'User Name',
              Iconsax.user_edit,
            ),
            expands: false,
          ),
          const SizedBox(height: 16),

          /// Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: InputFieldStyle.inputFieldStyle(
              context,
              'Email',
              Icons.email,
            ),
            expands: false,
          ),
          const SizedBox(height: 16),

          // Phone number
          TextFormField(
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
          const SizedBox(height: 16),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => Validator.validatePassword(value),
              decoration: InputFieldStyle.signupPasswordFieldStyle(),
              expands: false,
            ),
          ),
          const SizedBox(height: 16),

          /// Sign up button
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: 'Create Account',
              textFontSize: 16,
              onTap: () => controller.signup(),
            ),
          ),
        ],
      ),
    );
  }
}
