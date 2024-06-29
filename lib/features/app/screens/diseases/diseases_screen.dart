import 'package:flutter/material.dart';
import 'package:mental_health/common/widgets/refresh.dart';
import 'package:mental_health/features/app/screens/diseases/widgets/disease_card.dart';

class DiseasesList extends StatelessWidget {
  const DiseasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diseases'), centerTitle: true),
      body: Refresh(
        isPurple: true,
        widget: ListView(
          children: const [
            // Depression
            DiseaseCard(
              diseaseName: 'Depression',
              diseaseDescription:
                  'Characterized by feelings of sadness, hopelessness, and difficulty with thinking, memory, eating and sleeping.',
            ),

            // Bipolar Disorder
            DiseaseCard(
              diseaseName: 'Bipolar Disorder',
              diseaseDescription:
                  'Marked by intense shifts in mood, energy levels, thinking patterns, and behavior, including hypomanic/manic and depressive episodes.',
            ),

            // Premenstrual Dysphoric Disorder
            DiseaseCard(
              diseaseName: 'Premenstrual Dysphoric Disorder',
              diseaseDescription:
                  'A condition that causes severe emotional symptoms, such as anxiety, irritability, and mood swings, in the days leading up to a woman\'s menstrual period.',
            ),

            // Disruptive Mood Dysregulation Disorder
            DiseaseCard(
              diseaseName: 'Disruptive Mood Dysregulation Disorder',
              diseaseDescription:
                  'A condition characterized by intense, frequent temper outbursts and a persistently irritable or angry mood.',
            ),

            // Postpartum Depression
            DiseaseCard(
              diseaseName: 'Postpartum Depression',
              diseaseDescription:
                  'A type of depression that occurs in women and people assigned female at birth after childbirth, characterized by feelings of sadness, hopelessness, and anxiety.',
            ),

            // Persistent Depressive Disorder
            DiseaseCard(
              diseaseName: 'Persistent Depressive Disorder',
              diseaseDescription:
                  'A chronic form of depression that lasts for at least two years, with symptoms that may occasionally lessen in severity.',
            ),

            // Seasonal Affective Disorder
            DiseaseCard(
              diseaseName: 'Seasonal Affective Disorder',
              diseaseDescription:
                  'A type of depression that occurs during certain seasons of the year, typically winter, characterized by feelings of sadness, lethargy, and social withdrawal.',
            ),
          ],
        ),
      ),
    );
  }
}
