// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:easypay/theme/appcolors.dart';
import 'package:flutter/material.dart';

class QuickActionsTab extends StatelessWidget {
  final List<Map<String, dynamic>> actions = [
    {"icon": Icons.download, "label": "Download profile as pdf"},
    {"icon": Icons.calendar_today, "label": "Change pay routine"},
    {"icon": Icons.person_off, "label": 'Take "Sarah Anderson" off the payroll'},
  ];

   QuickActionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...actions.map((action) {
          return ListTile(
            leading: Icon(action["icon"], color: AppColors.black),
            title: Text(
              action["label"],
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            tileColor: AppColors.primaryGreen,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onTap: () {
              // Handle each action tap here
            },
          );
        }).toList(),
        const SizedBox(height: 12),
        ListTile(
          leading: Icon(Icons.person_remove, color: Colors.white),
          title: Text(
            'Remove "Sarah Anderson" from team',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          tileColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
            // Handle removal action
          },
        ),
      ],
    );
  }
}
