import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../utils/constants/image_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 112, left: 48, right: 48, bottom: 48),
          child: Column(
            children: [
              Lottie.asset(
                Images.done,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 32),

              /// Title & sub-title
              const Text(
                'Your account has been successfully created!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome To Mental Health App.You Can Now Login To Our App Using This Account And Use Its Features.',
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
                  onTap: onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
