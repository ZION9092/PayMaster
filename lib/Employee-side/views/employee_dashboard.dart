import 'package:easypay/Employee-side/controllers/bottom_nav_controller.dart';
import 'package:easypay/Employee-side/employee_homepage.dart';
import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'transactions_page.dart';
import 'profile_page.dart';

class EmployeeDashboard extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    const EmployeeHomePage(),   // Home Page
    TransactionsPage(),   // Transactions Page
    ProfilePage(),        // Profile Page
  ];

  EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[navController.selectedIndex.value]), // Reactive Tab Change
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: navController.changeTabIndex, // Calls the controller method
          backgroundColor: AppColors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Transactions"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedItemColor: AppColors.primaryGreen,
          unselectedItemColor: AppColors.silver,
          showUnselectedLabels: true,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
