import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayslipScreen extends StatelessWidget {
  const PayslipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text(
            'Payslip',
            style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryGreen,
            ),
            onPressed: () {
              Get.back();
            },
          )),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PayslipHeader(),
            SizedBox(height: 20),
            PayslipDetails(),
            SizedBox(height: 20),
            PayslipSummary(),
            Spacer(),
            ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class PayslipHeader extends StatelessWidget {
  const PayslipHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Employee Payslip',
            style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Pay Period: January 2024',
            style: TextStyle(color: AppColors.silver, fontSize: 16)),
      ],
    );
  }
}

class PayslipDetails extends StatelessWidget {
  const PayslipDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PayslipRow(title: 'Employee Name', value: 'John Doe'),
            PayslipRow(title: 'Employee ID', value: 'EMP12345'),
            PayslipRow(title: 'Designation', value: 'Software Engineer'),
            PayslipRow(title: 'Department', value: 'IT'),
          ],
        ),
      ),
    );
  }
}

class PayslipSummary extends StatelessWidget {
  const PayslipSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PayslipRow(title: "Basic Salary", value: '\$3,500'),
            PayslipRow(title: 'Allowances', value: '\$500'),
            PayslipRow(title: 'Deductions', value: '-\$200'),
            const Divider(),
            PayslipRow(title: 'Net Salary', value: '\$3,800', isBold: true),
          ],
        ),
      ),
    );
  }
}

class PayslipRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;

  PayslipRow(
      {super.key,
      required this.title,
      required this.value,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, color: AppColors.primaryGreen)),
          Text(
            value,
            style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {}, // Implement download functionality
          icon: const Icon(
            Icons.download,
            color: AppColors.white,
          ),
          label: const Text(
            'Download Payslip',
            style: TextStyle(color: AppColors.white),
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.primaryGreen),
        ),
        ElevatedButton.icon(
          onPressed: () {}, // Implement share functionality
          icon: const Icon(Icons.share, color: AppColors.white),
          label: const Text(
            'Share',
            style: TextStyle(color: AppColors.white),
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.primaryGreen),
        ),
      ],
    );
  }
}
