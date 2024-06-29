import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DiseaseProbability extends StatelessWidget {
  const DiseaseProbability({
    super.key,
    required this.diseaseName,
    required this.diseaseProbability,
  });

  final String diseaseName;
  final double diseaseProbability;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff2E8D92),
        borderRadius: BorderRadius.circular(42),
      ),
      width: MediaQuery.sizeOf(context).width / 2 + 20,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: CircularPercentIndicator(
              animation: true,
              animationDuration: 1200,
              radius: 70,
              lineWidth: 15,
              progressColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurple.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              percent: diseaseProbability / 100,
              center: Text(
                '$diseaseProbability%',
                style: const TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${diseaseName.capitalizeFirst} Probability',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
