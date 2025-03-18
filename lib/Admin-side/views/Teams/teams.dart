import 'package:easypay/theme/appcolors.dart';
import 'package:easypay/Admin-side/views/Teams/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teams extends StatelessWidget {
  Teams({super.key});

  final List<Map<String, dynamic>> teams = [
    {"name": "Design Team", "icon": Icons.brush, "members": 8},
    {"name": "Developer Team", "icon": Icons.code, "members": 12},
    {"name": "Marketing Team", "icon": Icons.campaign, "members": 6},
    {"name": "Social Media Team", "icon": Icons.share, "members": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios,
                        color: AppColors.primaryGreen),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Division Groups",
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Team Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 40,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];

                    return GestureDetector(
                      onTap: () {
                        final selectedTeam = teams[index];

                        // Dummy Employee Data (Replace with API or Database)
                        final List<Map<String, dynamic>> employees = [
                          {
                            "name": "John Doe",
                            "role": "Senior Designer",
                            "image": "https://via.placeholder.com/150"
                          },
                          {
                            "name": "Jane Smith",
                            "role": "UX Researcher",
                            "image": "https://via.placeholder.com/150"
                          },
                          {
                            "name": "Mark Brown",
                            "role": "UI Specialist",
                            "image": "https://via.placeholder.com/150"
                          },
                        ];

                        // Navigate using GetX
                        Get.to(() => EmployeeListScreen(
                              teamName: selectedTeam["name"] ?? "Unknown Team",
                              employees: employees,
                            ));
                      },
                      child: Card(
                        elevation: 10,
                        color: AppColors.card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(team["icon"],
                                size: 50, color: AppColors.primaryGreen),
                            const SizedBox(height: 10),
                            Text(
                              team["name"],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen),
                            ),
                            Text(
                              "${team["members"]} Members",
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.silver,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        minimumSize: const Size(80, 80),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: CircleBorder()),
                    onPressed: () {},
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                    )),
              ),
              const SizedBox(height: 12),
              Center(
                  child: Text(
                "Add Team",
                style: TextStyle(
                    color: AppColors.secondaryGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              )
          )
            ],
          ),
        ),
      ),
    );
  }
}
