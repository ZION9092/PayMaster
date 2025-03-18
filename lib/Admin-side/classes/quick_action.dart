import 'package:easypay/Admin-side/classes/payslip_page.dart';
import 'package:easypay/Admin-side/views/Payslip/payslip_screen.dart';
import 'package:easypay/Admin-side/views/salary/salary_breakdown_page.dart';
import 'package:easypay/theme/appcolors.dart';
import 'package:easypay/Admin-side/views/Teams/teams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Actions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.silver),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildQuickAction(Icons.groups, "Teams", () => Get.to(() => Teams())),
            _buildQuickAction(Icons.receipt_long, "View Payslip", () => Get.to(() => PayslipScreen())),
            _buildQuickAction(Iconsax.document_text, "Salary Breakdown", () => Get.to(() => SalaryBreakdownPage())),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        splashColor: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(50),
        onTap: onTap, // Calls the navigation function
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15), // Shadow color
                    blurRadius: 25, // Softness of the shadow
                  ),
                ],
              ),
              child: Icon(icon, size: 30, color: AppColors.primaryGreen),
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.silver)),
          ],
        ),
      ),
    );
  }
}



