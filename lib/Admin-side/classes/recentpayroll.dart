import 'package:flutter/material.dart';

class Recentpayroll extends StatelessWidget {
  Recentpayroll({super.key});

  // Move the recent payments data outside the method
  final List<Map<String, String>> recentPayments = [
    {"team": "Design Team", "status": "success"},
    {"team": "Developer Team", "status": "failed"},
    {"team": "Marketing Team", "status": "success"},
    {"team": "Social Media Team", "status": "failed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Recent Payroll",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      SizedBox(
          height: 200, // Adjust height as needed
          child: ListView.builder(
            itemCount: recentPayments.length,
            itemBuilder: (context, index) {
              final payment = recentPayments[index];
              final isSuccess = payment["status"] == "success";
              return ListTile(
                leading: Icon(
                  isSuccess ? Icons.check_circle : Icons.cancel,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                title: Text("${payment["team"]} Payroll"),
                subtitle:
                    Text(isSuccess ? "Payment Successful" : "Payment Failed"),
              );
            },
          ))
    ]);
  }
}
