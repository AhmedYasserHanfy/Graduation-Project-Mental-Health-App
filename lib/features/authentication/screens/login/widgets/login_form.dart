import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health/features/authentication/controllers/login/login_controller.dart';
import 'package:mental_health/features/authentication/screens/password_configuration/forget_password.dart';
import '../../../../../common/styles/input_field_style.dart';
import '../../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../../utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            // Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: InputFieldStyle.inputFieldStyle(
                context,
                'Email',
                Icons.email,
              ),
            ),
            const SizedBox(height: 16),

            // password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => Validator.validateEmptyText(
                  'Password',
                  value,
                ),
                decoration: InputFieldStyle.loginPasswordFieldStyle(),
                expands: false,
              ),
            ),
            const SizedBox(height: 8),

            // Remember me & forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),

                /// Forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sign in button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'Sign In',
                textFontSize: 18,
                onTap: () => controller.emailAndPasswordSignIn(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
