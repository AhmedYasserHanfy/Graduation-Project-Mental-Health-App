import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double textFontSize;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.textFontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff6AAFE6)),
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textFontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
