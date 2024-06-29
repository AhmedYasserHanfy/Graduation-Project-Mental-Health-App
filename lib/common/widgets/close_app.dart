import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';

class CloseApp extends StatelessWidget {
  const CloseApp({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: 'Press again to exit the application',
      background: Colors.black,
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      child: screen,
    );
  }
}
