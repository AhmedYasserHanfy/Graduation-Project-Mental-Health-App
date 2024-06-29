import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;

  const DrawerItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(
          image,
          width: 40,
          // color: Colors.tealAccent,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
