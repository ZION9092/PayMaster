import 'package:easypay/theme/appcolors.dart';
import 'package:easypay/Admin-side/views/Teams/employee_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../controllers/employee_controller.dart';

class EmployeeListScreen extends StatelessWidget {
  final String teamName;

  EmployeeListScreen({super.key, required this.teamName, required List<Map<String, dynamic>> employees});

  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: AppColors.primaryGreen),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    teamName,
                    style: const TextStyle(
                      color: AppColors.primaryGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Employees List
              Expanded(
                child: Obx(() {
                  if (employeeController.isLoading.value) {
                    return const Center(child: CupertinoActivityIndicator(color: AppColors.primaryGreen,radius: 20,));
                  }

                  if (employeeController.employees.isEmpty) {
                    return const Center(
                      child: Text(
                        "No employees found",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  }

                  return MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    itemCount: employeeController.employees.length,
                    itemBuilder: (context, index) {
                      final employee = employeeController.employees[index];
                      return InkWell(
                        onTap: () {
                          Get.to(EmployeeDetailsPage());
                        },
                        child: Card(
                          color: AppColors.card,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primaryGreen,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  employee.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryGreen),
                                ),
                                Text(
                                  employee.jobTitle,
                                  style: const TextStyle(
                                      color: AppColors.secondaryGreen,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 80),
                    backgroundColor: AppColors.primaryGreen,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: CircleBorder(),
                  ),
                  onPressed: (){},
                
                  child: Text("+",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40
                  ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                  child: Text(
                "Add Employee",
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


