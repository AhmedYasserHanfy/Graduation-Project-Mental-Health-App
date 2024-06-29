import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.red.shade800),
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
