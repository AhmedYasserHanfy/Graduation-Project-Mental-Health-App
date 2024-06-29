import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/image_strings.dart';
import '../square_tile.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Center(
      child: GestureDetector(
        onTap: () => controller.googleSignIn(),
        child: const SquareTile(imagePath: Images.google),
      ),
    );
  }
}
