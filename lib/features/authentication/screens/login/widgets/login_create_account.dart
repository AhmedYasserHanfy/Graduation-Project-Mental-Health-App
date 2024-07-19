import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signup/signup.dart';

class LoginCreateAccount extends StatelessWidget {
  const LoginCreateAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not a member?'),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => Get.to(() => const SignupScreen()),
          child: const Text(
            'Register now',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
