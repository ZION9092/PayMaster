import 'package:easypay/Admin-side/controllers/payday_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaydayCountdown extends StatelessWidget {
  final PaydayController controller = Get.put(PaydayController());

   PaydayCountdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      height: 50,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: controller.backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.daysLeft.value > 0
                    ? "Next Payday in ${controller.daysLeft.value} days"
                    : "Payday is today!",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
