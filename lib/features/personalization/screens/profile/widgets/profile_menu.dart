import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon = Icons.arrow_forward_ios,
  });

  final String title, value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0 / 1.5),
        child: ListTile(
            title: Text(title, style: const TextStyle(color: Colors.teal)),
            subtitle: Text(value),
            trailing: Icon(icon)),
      ),
    );
  }
}
