import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mental_health/app.dart';
import 'package:mental_health/data/repositories/authentication/authentication_repository.dart';
import 'package:mental_health/firebase_options.dart';
import 'package:mental_health/theme/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Local Storage
  await GetStorage.init();

  // await splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MentalHealthApp(),
    ),
  );
}
