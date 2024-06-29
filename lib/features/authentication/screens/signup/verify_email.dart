import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health/data/repositories/authentication/authentication_repository.dart';
import 'package:mental_health/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:mental_health/utils/constants/image_strings.dart';

import '../../../../common/widgets/buttons/custom_elevated_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Lottie.asset(
                Images.emailVerified,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 32),

              /// Title & sub-title
              const Text(
                'Verify your email address!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Text(
                email ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              const Text(
                'Congratulations Your Account Awaits: Verify your email to start using the app.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: 'Continue',
                  textFontSize: 16,
                  onTap: () => controller.checkEmailVerificationStatus(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Resend Email'),
                  onPressed: () => controller.sendEmailVerification(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
