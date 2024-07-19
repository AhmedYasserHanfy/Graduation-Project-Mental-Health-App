import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class EmotionResult extends StatelessWidget {
  const EmotionResult({super.key, required this.emotion});

  final String emotion;

  String? getEmotionImage(String emotion) {
    if (emotion.toLowerCase() == 'happy') {
      return Images.happy;
    } else if (emotion.toLowerCase() == 'sad') {
      return Images.sad;
    } else if (emotion.toLowerCase() == 'fearful') {
      return Images.fear;
    } else if (emotion.toLowerCase() == 'angry') {
      return Images.angry;
    } else if (emotion.toLowerCase() == 'disgust') {
      return Images.disgust;
    } else if (emotion.toLowerCase() == 'calm') {
      return Images.calm;
    } else if (emotion.toLowerCase() == 'neutral') {
      return Images.neutral;
    } else if (emotion.toLowerCase() == 'surprised') {
      return Images.surprised;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 70,
            width: MediaQuery.sizeOf(context).width / 4 + 10,
            decoration: BoxDecoration(
              color: const Color(0xff2E8D92),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(
              'Emotion',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            alignment: Alignment.center,
            height: 70,
            width: MediaQuery.sizeOf(context).width / 4 + 10,
            decoration: BoxDecoration(
              color: const Color(0xff2E8D92),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              emotion.capitalizeFirst!,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            alignment: Alignment.center,
            height: 70,
            width: MediaQuery.sizeOf(context).width / 4 + 10,
            decoration: BoxDecoration(
              color: const Color(0xff2E8D92),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(getEmotionImage(emotion)!, height: 60),
          ),
        ],
      ),
    );
  }
}
