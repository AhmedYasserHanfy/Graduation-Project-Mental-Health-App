import 'package:flutter/material.dart';

import '../../../../common/widgets/refresh.dart';
import '../../../../utils/constants/image_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Guide'),
        centerTitle: true,
      ),
      body: Refresh(
        widget: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Image.asset(Images.userGuideLogo, height: 150),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'This app deals only with',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' audio files',
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
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'To use the app follow these',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' steps',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ':'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 36.0, right: 36.0),
              child: Text.rich(
                TextSpan(
                  text: '1) Create an',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' account ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'on the app.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 36.0, right: 36.0),
              child: Text.rich(
                TextSpan(
                  text: '2) Upload the',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' audio file ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'on the app using upload icon.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 36.0, right: 36.0),
              child: Text.rich(
                TextSpan(
                  text: '3) Press the [',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Analyze the file ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '] button.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                left: 36.0,
                right: 36.0,
                bottom: 16.0,
              ),
              child: Text.rich(
                TextSpan(
                  text: '4) Then the app will display',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' the result ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '-->',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    TextSpan(
                      text: ' The Predicted Emotion & Mental Issue',
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
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'The Audio File',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Specifications',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ':'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 36.0, right: 36.0),
              child: Text.rich(
                TextSpan(
                  text: '- The audio file must be a',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' very short ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'audio.'),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0, left: 36.0, right: 36.0),
              child: Text.rich(
                TextSpan(
                  text: '- The audio file must be a',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' wave ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'file on format ['),
                    TextSpan(
                      text: ' .wav ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '].'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 10,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
