import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';

class PaymentProfileTab extends StatelessWidget {
  const PaymentProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today, color: AppColors.primaryGreen),
            title: Text("Date joined", style: TextStyle(color: AppColors.white),),
            subtitle: Text("27th June 2024", style: TextStyle(color: AppColors.white),)
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: AppColors.primaryGreen),
            title: Text("Pay date", style: TextStyle(color: AppColors.white)),
            subtitle: Text("28th every month", style: TextStyle(color: AppColors.white)),
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: AppColors.primaryGreen),
            title: Text("Salary/Month", style: TextStyle(color: AppColors.white)),
            subtitle: Text("\$3,800", style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}