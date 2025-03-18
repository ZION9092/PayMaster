import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/balance_card_controller.dart';
import '../../theme/appcolors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final BalanceController controller = Get.put(BalanceController());

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.primaryGreen,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Company Account",
              style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                // ✅ Fix: Remove the quotes so the condition works
                Obx(() => Text(
                      controller.isBalanceVisible.value
                          ? '₦\10,000,000'
                          : '****',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                        fontFamily: 'Lato',
                        fontFamilyFallback: ['Roboto', 'Helvetica'],
                      ),
                    )),
                const SizedBox(width: 8),
                
                // ✅ Fix: Wrap only the `Icon` inside `Obx`
                IconButton(
                  onPressed: controller.toggleBalance,
                  icon: Obx(() => Icon(
                        controller.isBalanceVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.black,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                ),
                onPressed: () {},
                child: const Text(
                  "+ Add Deposit",
                  style: TextStyle(color: AppColors.primaryGreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


