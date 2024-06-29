import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:mental_health/features/authentication/screens/login/login.dart';

import '../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/constants/image_strings.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              /// Image
              Lottie.asset(
                Images.resetPassword,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 32),

              // Email
              Text(
                email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              /// Title & sub-title
              const Text(
                'Password Reset Email Sent',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const Text(
                'We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Done',
                  textFontSize: 16,
                  onTap: () => Get.offAll(() => const LoginScreen()),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Resend Email'),
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
