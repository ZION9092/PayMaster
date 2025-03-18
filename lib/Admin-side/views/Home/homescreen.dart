import 'package:easypay/Admin-side/views/admin_stats_page.dart';
import 'package:easypay/Admin-side/views/history_page.dart';
import 'package:easypay/Employee-side/controllers/bottom_nav_controller.dart';
import 'package:easypay/theme/appcolors.dart';
import 'package:easypay/Admin-side/classes/balancecard.dart';
import 'package:easypay/Admin-side/classes/payday_countdown.dart';
import 'package:easypay/Admin-side/classes/quick_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomePage(),          // Corrected: Separate home content
    AdminStatsPage(),    // Stats Page
    HistoryPage(),       // History Page
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
      child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: pages[navController.selectedIndex.value], // Dynamically update content
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.backgroundColor,
              currentIndex: navController.selectedIndex.value,
              onTap: (index) => navController.changeTabIndex(index),
              selectedItemColor: AppColors.primaryGreen,
              unselectedItemColor: AppColors.silver,
              selectedLabelStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              items: const [
                BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Iconsax.chart), label: "Stats"),
                BottomNavigationBarItem(icon: Icon(Iconsax.book1), label: "History"),
              ],
            ),
          ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes items apart
              children: [
                // Left Section: Circle Avatar & Text
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.secondaryGreen,
                      radius: 16,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Text("Hi, Emerie",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryGreen)),
                  ],
                ),

                // Right Section: Search & Notification Icons
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.notifications_on_outlined,
                        size: 30,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const BalanceCard(),
            const SizedBox(height: 15),
            PaydayCountdown(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: QuickActions(),
            ),
          ],
        ),
      ),
    );
  }
}

