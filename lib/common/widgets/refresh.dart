import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Refresh extends StatelessWidget {
  const Refresh({super.key, required this.widget, this.isPurple = false});

  final Widget widget;
  final bool isPurple;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        return await Future.delayed(const Duration(seconds: 2));
      },
      color: isPurple ? Colors.deepPurple : Colors.teal,
      backgroundColor: isPurple ? Colors.deepPurple[200] : Colors.teal[200],
      height: 300,
      animSpeedFactor: 2,
      showChildOpacityTransition: false,
      child: widget,
    );
  }
}
