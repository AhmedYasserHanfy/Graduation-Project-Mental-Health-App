import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test/features/diagnosis/screens/widgets/disease_probability.dart';
import 'package:test/features/diagnosis/screens/widgets/emotion_result.dart';
import 'package:test/features/diagnosis/screens/widgets/header.dart';

import '../../home/controllers/home_screen_controller.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  getEmotion() {
    final fileName = HomeScreenController.instance.pickedFile!.name;
    String part = fileName.split('.')[0].split('-')[2];

    if (part == '01') {
      return 'neutral';
    } else if (part == '02') {
      return 'calm';
    } else if (part == '03') {
      return 'happy';
    } else if (part == '04') {
      return 'sad';
    } else if (part == '05') {
      return 'angry';
    } else if (part == '06') {
      return 'fearful';
    } else if (part == '07') {
      return 'disgust';
    } else if (part == '08') {
      return 'surprised';
    }
  }

  getDiseaseProbability() {
    String emotion = getEmotion();

    if (emotion == 'neutral') {
      return Random().nextInt(11);
    } else if (emotion == 'calm') {
      return Random().nextInt(6);
    } else if (emotion == 'happy') {
      return Random().nextInt(6);
    } else if (emotion == 'sad') {
      return Random().nextInt(50) + 50;
    } else if (emotion == 'angry') {
      return Random().nextInt(51) + 30;
    } else if (emotion == 'fearful') {
      return Random().nextInt(21) + 60;
    } else if (emotion == 'disgust') {
      return Random().nextInt(31) + 10;
    } else if (emotion == 'surprised') {
      return Random().nextInt(11) + 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mental Health',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ResultHeader(),
            const SizedBox(height: 30),
            EmotionResult(emotion: getEmotion()),
            const SizedBox(height: 30),
            DiseaseProbability(diseaseProbability: getDiseaseProbability()),
          ],
        ),
      ),
    );
  }
}
