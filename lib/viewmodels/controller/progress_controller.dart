import 'package:get/get.dart';

class ProgressController extends GetxController {
  RxDouble progress = 0.3.obs;

  void setProgress(double value) {
    progress.value = value.clamp(0.0, 1.0);
  }

  void increaseProgress() {
    if (progress.value < 1.0) progress.value += 0.1;
  }

  void decreaseProgress() {
    if (progress.value > 0.0) progress.value -= 0.1;
  }
}
