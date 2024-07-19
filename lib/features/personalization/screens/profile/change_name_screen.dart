import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test/features/personalization/screens/profile/widgets/change_name_form.dart';

import '../../../../utils/constants/image_strings.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Name')),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              const Text(
                'Use real name for easy verification. This name will appear on several pages',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 32),
        
              // Animation
              Center(child: Lottie.asset(Images.update, height: 250)),
              const SizedBox(height: 32),
        
              /// Form
              const ChangeNameForm(),
            ],
          ),
        ),
      ),
    );
  }
}
