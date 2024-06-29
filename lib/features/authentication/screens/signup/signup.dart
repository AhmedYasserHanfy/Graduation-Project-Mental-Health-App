import 'package:flutter/material.dart';
import 'package:mental_health/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                'Let\'s create an account for you',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              /// Form
              SignupForm(),
              SizedBox(height: 16),

              /// Divider
              FormDivider(dividerText: 'Or Sign Up with'),
              SizedBox(height: 16.0),

              // Footer
              SocialButtons(),
              // SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
