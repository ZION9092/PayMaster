import 'package:easypay/Admin-side/views/Payslip/payslip_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easypay/Employee-side/views/notifications_page.dart';
import 'package:easypay/theme/appcolors.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  List<String> announcements = [
    "🎉 Performance Bonus of 5% added for all employees this month!",
    "🚨 New Payroll System Update - Expect Delays",
    "📢 Company Holiday on October 10th - Offices Closed"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text("PayMaster",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.white),
            onPressed: () {
              Get.to(() => NotificationsPage());
            },
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Banner
            Text("Welcome Back, John!",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 10),
            Text("Your salary summary is here",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade400)),
            const SizedBox(height: 20),

            

            // Salary Overview Card (Existing UI)
            Card(
              color: Colors.grey.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Latest Salary",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text("\$2,500.00",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Next Payment: Sept 30, 2024",
                            style: TextStyle(color: Colors.grey.shade500)),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => const PayslipScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("View Payslip"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Company Announcements & HR Updates
            if (announcements.isNotEmpty) ...[
              Text("📢 Company Announcements",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              Column(
                children: announcements.map((announcement) {
                  return Dismissible(
                    key: Key(announcement),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      setState(() {
                        announcements.remove(announcement);
                      });
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(LucideIcons.trash, color: Colors.white),
                    ),
                    child: Card(
                      color: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Icon(LucideIcons.megaphone,
                                color: Colors.greenAccent, size: 24),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(announcement,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade300)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}

