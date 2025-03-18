import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PaydayController extends GetxController {
  DateTime nextPayday = DateTime(2024, 3, 15); // Change dynamically
  RxInt daysLeft = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _updateTime();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    int remainingDays = nextPayday.difference(DateTime.now()).inDays;
    daysLeft.value = remainingDays < 0 ? 0 : remainingDays; // Ensure it doesn't go negative
  }

  Color get backgroundColor {
    if (daysLeft.value > 7) return Colors.green; // Plenty of time
    if (daysLeft.value > 3) return Colors.amber; // Moderate warning
    return Colors.red; // Very near payday
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
