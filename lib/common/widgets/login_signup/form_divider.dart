import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(thickness: 2, color: Colors.grey[400])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(dividerText),
          ),
          Expanded(child: Divider(thickness: 2, color: Colors.grey[400])),
        ],
      ),
    );
  }
}
