import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../features/authentication/controllers/login/login_controller.dart';
import '../../features/authentication/controllers/signup/signup_controller.dart';
import '../../features/personalization/controllers/user_controller.dart';

class InputFieldStyle {
  static InputDecoration inputFieldStyle(
    BuildContext context,
    String text,
    IconData icon,
  ) {
    return InputDecoration(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: TextStyle(
          fontSize: text.toLowerCase() == 'first name' ||
                  text.toLowerCase() == 'last name'
              ? 12
              : 16),
      labelText: text,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black54
              : Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: Colors.orange),
      ),
    );
  }

  static InputDecoration signupPasswordFieldStyle() {
    final controller = SignupController.instance;
    return InputDecoration(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle(fontSize: 16),
      labelText: 'Password',
      prefixIcon: const Icon(Iconsax.password_check),
      suffixIcon: IconButton(
        onPressed: () =>
            controller.hidePassword.value = !controller.hidePassword.value,
        icon: Icon(
          controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(Get.context!).brightness == Brightness.light
              ? Colors.black54
              : Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: Colors.orange),
      ),
    );
  }

  static InputDecoration loginPasswordFieldStyle() {
    final controller = LoginController.instance;
    return InputDecoration(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle(fontSize: 16),
      labelText: 'Password',
      prefixIcon: const Icon(Iconsax.password_check),
      suffixIcon: IconButton(
        onPressed: () =>
            controller.hidePassword.value = !controller.hidePassword.value,
        icon: Icon(
          controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(Get.context!).brightness == Brightness.light
              ? Colors.black54
              : Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: Colors.orange),
      ),
    );
  }

  static InputDecoration reAuthPasswordFieldStyle() {
    final controller = UserController.instance;
    return InputDecoration(
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle(fontSize: 16),
      labelText: 'Password',
      prefixIcon: const Icon(Iconsax.password_check),
      suffixIcon: IconButton(
        onPressed: () =>
        controller.hidePassword.value = !controller.hidePassword.value,
        icon: Icon(
          controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(Get.context!).brightness == Brightness.light
              ? Colors.black54
              : Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: Colors.orange),
      ),
    );
  }
}
