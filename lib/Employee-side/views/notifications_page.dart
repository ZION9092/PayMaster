import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Salary Credited",
      "subtitle": "Your salary for March has been credited."
    },
    {
      "title": "Company Announcement",
      "subtitle": "New bonus structure will be implemented next month."
    },
    {
      "title": "Tax Deduction Update",
      "subtitle": "Your tax deduction details have been updated."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
    {
      "title": "Payroll Processing",
      "subtitle": "Payroll processing will be completed by 5th April."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.silver,
                )),
            backgroundColor: Colors.black,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double percentage =
                    (constraints.biggest.height - kToolbarHeight) /
                        (120.0 - kToolbarHeight);

                return FlexibleSpaceBar(
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      color: percentage < 0.5
                          ? AppColors.primaryGreen
                          : AppColors.black,
                    ),
                  ),
                  background: Container(
                    color: percentage < 0.5
                        ? Colors.black
                        : AppColors.primaryGreen,
                  ),
                  centerTitle: false,
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading:
                      Icon(Icons.notifications, color: AppColors.primaryGreen),
                  title: Text(notifications[index]["title"]!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen)),
                  subtitle: Text(notifications[index]["subtitle"]!),
                );
              },
              childCount: notifications.length,
            ),
          ),
        ],
      ),
    );
  }
}
