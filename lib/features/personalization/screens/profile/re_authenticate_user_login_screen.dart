import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/common/widgets/buttons/custom_elevated_button.dart';
import 'package:mental_health/features/personalization/controllers/user_controller.dart';

import '../../../../common/styles/input_field_style.dart';
import '../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: InputFieldStyle.inputFieldStyle(
                    context,
                    'Email',
                    Icons.email,
                  ),
                  expands: false,
                ),
                const SizedBox(height: 16),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        Validator.validateEmptyText('Password', value),
                    decoration: InputFieldStyle.reAuthPasswordFieldStyle(),
                    expands: false,
                  ),
                ),
                const SizedBox(height: 32),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: 'Verify',
                    textFontSize: 16,
                    onTap: () =>
                        controller.reAuthenticateEmailAndPasswordUser(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
