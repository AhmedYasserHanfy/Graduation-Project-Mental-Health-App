import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.resultLogo, height: 100),
          const SizedBox(width: 20),
          const Text('Analysis Result', style: TextStyle(fontSize: 21)),
        ],
      ),
    );
  }
}
