import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/styles/input_field_style.dart';
import '../../../../../common/widgets/buttons/custom_elevated_button.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeNameForm extends StatelessWidget {
  const ChangeNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Form(
      key: controller.updateUserNameFormKey,
      child: Column(
        children: [
          // First name
          TextFormField(
            keyboardType: TextInputType.name,
            controller: controller.firstName,
            validator: (value) =>
                Validator.validateEmptyText('First name', value),
            decoration: InputFieldStyle.inputFieldStyle(
              context,
              'First Name',
              Iconsax.user,
            ),
            expands: false,
          ),
          const SizedBox(height: 16),

          // Last name
          TextFormField(
            keyboardType: TextInputType.name,
            controller: controller.lastName,
            validator: (value) =>
                Validator.validateEmptyText('Last name', value),
            decoration: InputFieldStyle.inputFieldStyle(
              context,
              'Last Name',
              Iconsax.user,
            ),
            expands: false,
          ),
          const SizedBox(height: 24),

          // Save button
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              text: 'Save',
              textFontSize: 16,
              onTap: () => controller.updateUserName(),
            ),
          )
        ],
      ),
    );
  }
}
