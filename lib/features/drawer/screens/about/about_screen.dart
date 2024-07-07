import 'package:flutter/material.dart';
import 'package:mental_health/common/widgets/refresh.dart';
import 'package:mental_health/utils/constants/image_strings.dart';
import 'package:mental_health/utils/formatters/formatter.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About'), centerTitle: true),
      body: Refresh(
        widget: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 21.0),
              child: Center(
                child: Text(
                  'Mental Health App',
                  style: TextStyle(fontSize: 31, fontFamily: 'Pacifico'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 21.0),
              child: Center(
                child: Text('V1.0.0', style: TextStyle(fontSize: 31)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text(
                'The emotional state of the patient plays an important role in determining some diseases related to the mental state of the patient.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Our app uses',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' AI technology ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'to analyze an recorded audio for the patient and identify the',
                    ),
                    TextSpan(
                      text: ' emotional state ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'of the patient from his voice.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Then we can use this',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' emotion ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'to diagnose some'),
                    TextSpan(
                      text: ' mental diseases ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'like depression.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'This system uses',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Speech Emotion Recognition ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'technology to specify the'),
                    TextSpan(
                      text: ' patient\'s emotion',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'This system cannot be used as a',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' stand-alone tool ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'for diagnosing'),
                    TextSpan(
                      text: ' mental health problems, ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'but it will be an'),
                    TextSpan(
                      text: ' assistant ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'to the doctor in diagnosing the',
                    ),
                    TextSpan(
                      text: ' mental health issues',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'This software is our',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Graduation Project ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'from the Faculty of Computers and Information,',
                    ),
                    TextSpan(
                      text: ' Zagazig University',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(Images.universityLogo, height: 112),
                  Image.asset(Images.facultyLogo, height: 112),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(color: Colors.blue.shade700, thickness: 2),
                  const Text(
                    'Under the supervision of',
                    style: TextStyle(fontSize: 21),
                  ),
                  const Text(
                    'Dr. Nissreen El-Saber',
                    style: TextStyle(fontSize: 21),
                  ),
                  Divider(color: Colors.blue.shade700, thickness: 2),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Formatter.formatDate(time),
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
