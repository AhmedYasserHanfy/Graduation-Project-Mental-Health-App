import 'package:flutter/material.dart';
import 'package:mental_health/features/app/screens/diagnosis/widgets/disease_probability.dart';
import 'package:mental_health/features/app/screens/diagnosis/widgets/emotion_result.dart';
import 'package:mental_health/features/app/screens/diagnosis/widgets/header.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ResultHeader(),
            SizedBox(height: 30),
            EmotionResult(emotion: 'happy'),
            SizedBox(height: 30),
            DiseaseProbability(
              diseaseName: 'depression',
              diseaseProbability: 50,
            ),
          ],
        ),
      ),
    );
  }
}
