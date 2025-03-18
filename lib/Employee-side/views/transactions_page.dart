import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {"date": "Sept 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "Aug 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Pending"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Unpaid"},
    {"date": "Sept 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "Aug 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Pending"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Unpaid"},
    {"date": "Sept 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "Aug 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Pending"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Unpaid"},
    {"date": "Sept 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "Aug 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Pending"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Unpaid"},
    {"date": "Sept 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "Aug 30, 2024", "amount": "\$2,500", "status": "Paid"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Pending"},
    {"date": "July 30, 2024", "amount": "\$2,500", "status": "Unpaid"},
  ];

  TransactionsPage({super.key});

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
            backgroundColor: Colors.black,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double percentage = (constraints.biggest.height - kToolbarHeight) /
                    (120.0 - kToolbarHeight);

                return Container(
                  color: percentage < 0.5 ? AppColors.primaryGreen : AppColors.black,
                  child: FlexibleSpaceBar(
                    title: Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 18,
                        color: percentage < 0.5 ? Colors.black : AppColors.primaryGreen,
                      ),
                    ),
                    centerTitle: false,
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = transactions[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item["date"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                            Text(
                              item["amount"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryGreen,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: item["status"] == "Paid"
                                    ? Colors.green.shade100
                                    : item["status"] == "Pending"
                                        ? Colors.orange.shade100
                                        : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                item["status"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: item["status"] == "Paid"
                                      ? Colors.green
                                      : item["status"] == "Pending"
                                          ? Colors.orange
                                          : Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index < transactions.length - 1) // Add divider except for last item
                        Divider(
                          color: AppColors.primaryGreen,
                          thickness: 0.5,
                          height: 18,
                        ),
                    ],
                  );
                },
                childCount: transactions.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


