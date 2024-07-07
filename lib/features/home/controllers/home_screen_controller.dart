import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mental_health/utils/popups/full_screen_loader.dart';
import 'package:mental_health/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../diagnosis/screens/analytic_screen.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  /// Variables
  PlatformFile? pickedFile;

  // Pick the audio file
  Future<void> pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav'],
    );

    if (result != null) {
      pickedFile = result.files.first;
      Loaders.doneUpload(fileName: pickedFile!.name);
    }
  }

  // Analyze the file using DL
  Future<void> analyzeAudioFile() async {
    if (pickedFile == null) {
      Loaders.customError(message: 'Upload the audio file first.');
    } else {
      FullScreenLoader.openLoadingDialog(
        'Analyzing the file...',
        Theme.of(Get.context!).brightness == Brightness.light
            ? Images.lightProcessing
            : Images.darkProcessing,
      );
      Timer.periodic(const Duration(seconds: 10), (timer) async {
        await FullScreenLoader.stopLoading();
        timer.cancel();
        Get.to(() => const AnalyticScreen(emotion: 'happy'));
      });
    }
  }
}
