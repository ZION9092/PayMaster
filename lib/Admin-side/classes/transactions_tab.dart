import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';


class TransactionsTab extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {
      "image": "https://via.placeholder.com/150", // Replace with actual image URL
      "title": "Received Salary",
      "team": "Product Team",
      "company": "Apple",
      "date": "August 28, 2024",
      "time": "11:19 AM",
      "amount": "\$3,800"
    },
    {
      "image": "https://via.placeholder.com/150",
      "title": "Received Salary",
      "team": "Product Team",
      "company": "Apple",
      "date": "July 28, 2024",
      "time": "11:19 AM",
      "amount": "\$3,800"
    },
    {
      "image": "https://via.placeholder.com/150",
      "title": "Received Salary",
      "team": "Product Team",
      "company": "Apple",
      "date": "June 28, 2024",
      "time": "11:19 AM",
      "amount": "\$3,800"
    },
  ];

   TransactionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => Divider(color: Colors.grey.shade300),
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primaryGreen,
          ),
          title: Text(
            transaction["title"]!,
            style: TextStyle(fontSize: 14, color: AppColors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  children: [
                    TextSpan(text: transaction["team"]!),
                    TextSpan(
                      text: "  |  ",
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                    TextSpan(
                      text: transaction["company"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                "${transaction["date"]!}  ${transaction["time"]!}",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          trailing: Text(
            transaction["amount"]!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryGreen),
          ),
        );
      },
    );
  }
}
