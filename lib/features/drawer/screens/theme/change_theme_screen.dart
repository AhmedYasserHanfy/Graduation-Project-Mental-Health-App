import 'package:flutter/material.dart';
import 'package:mental_health/features/drawer/providers/theme_provider.dart';
import 'package:mental_health/utils/constants/image_strings.dart';
import 'package:provider/provider.dart';

class ChangeThemeScreen extends StatelessWidget {
  const ChangeThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? Images.lightMode
                  : Images.darkMode,
              key: Key(Theme.of(context).brightness.toString()),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child:
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                return DropdownButton<String>(
                  value: provider.currentTheme,
                  underline: Container(height: 2, color: Colors.white),
                  items: [
                    // Light, dark, and system
                    DropdownMenuItem<String>(
                      value: 'light',
                      child: Row(
                        children: [
                          const Text('Light', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          Image.asset(Images.lightModeIcon, width: 40),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'dark',
                      child: Row(
                        children: [
                          const Text('Dark', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          Image.asset(
                            Images.darkModeIcon,
                            width: 30,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'system',
                      child: Row(
                        children: [
                          const Text('System', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          Image.asset(Images.systemModeIcon, width: 24),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (String? value) =>
                      provider.changeTheme(value ?? 'system'),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
