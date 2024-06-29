import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:mental_health/bindings/general_bindings.dart';
import 'package:mental_health/theme/theme_provider.dart';

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return GetMaterialApp(
        title: 'Mental Health',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode,
        initialBinding: GeneralBindings(),
        home: const Scaffold(
          backgroundColor: Colors.blue,
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
      );
    });
  }
}

// Github password AhmedYasser000@1234_ert#30078