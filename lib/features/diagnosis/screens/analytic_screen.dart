import 'package:flutter/material.dart';
import 'package:mental_health/features/diagnosis/screens/widgets/disease_probability.dart';
import 'package:mental_health/features/diagnosis/screens/widgets/emotion_result.dart';
import 'package:mental_health/features/diagnosis/screens/widgets/header.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key, required this.emotion});

  final String emotion;

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
            EmotionResult(emotion: emotion),
            const SizedBox(height: 30),
            const DiseaseProbability(
              diseaseName: 'depression',
              diseaseProbability: 50,
            ),
          ],
        ),
      ),
    );
  }
}
