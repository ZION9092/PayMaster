import 'package:easypay/Admin-side/classes/payment_profile_tab.dart';
import 'package:easypay/Admin-side/classes/quick_actions_tab.dart';
import 'package:easypay/Admin-side/classes/transactions_tab.dart';
import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTabController(
            length: 3, // 3 Tabs
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryGreen,
                      ),
                    ),
          
                    // Employee Info Section
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.primaryGreen,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sarah Anderson",
                                style: TextStyle(color: AppColors.white
                                    ,fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const Text("Product Manager",
                                  style: TextStyle(
                                      color: AppColors.silver,
                                      fontWeight: FontWeight.w700)),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryGreen,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Pay Sarah",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: AppColors.primaryGreen,
                                    ),
                                    label: const Text(
                                      "Edit",
                                      style: TextStyle(color: AppColors.primaryGreen),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    // Tab Bar
                    const TabBar(
                      indicatorColor: AppColors.primaryGreen,
                      labelColor: AppColors.primaryGreen,
                      unselectedLabelColor: AppColors.silver,
                      labelStyle: TextStyle(fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(text: "History"),
                        Tab(text: "Transactions"),
                        Tab(text: "Quick Actions"),
                      ],
                    ),
                    // TabBarView - Content of each tab
                     Expanded(
                      child: TabBarView(
                        children: [
                          PaymentProfileTab(), // First Tab Content
                          TransactionsTab(), // Second Tab Content
                          QuickActionsTab(), // Third Tab Content
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

