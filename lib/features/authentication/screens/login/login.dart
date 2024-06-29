import 'package:flutter/material.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_create_account.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            right: 24.0,
            bottom: 24.0,
          ),
          child: Column(
            children: [
              // Header => Logo, title & sub-title
              LoginHeader(),

              // Form
              LoginForm(),

              // Divider
              FormDivider(dividerText: 'Or Sign In with'),
              SizedBox(height: 24.0),

              // Footer
              SocialButtons(),
              SizedBox(height: 24.0),

              // Register now
              LoginCreateAccount()
            ],
          ),
        ),
      ),
    );
  }
}
