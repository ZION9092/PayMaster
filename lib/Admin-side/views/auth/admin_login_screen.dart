import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easypay/theme/appcolors.dart';

class AdminLoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var rememberMe = false.obs;
}

class AdminLoginScreen extends StatelessWidget {
  final AdminLoginController controller = Get.put(AdminLoginController());

  AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Admin! 👋",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                style: TextStyle(color: AppColors.silver),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: AppColors.silver),
                    filled: true,
                    fillColor: AppColors.silver.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryGreen),
                        borderRadius: BorderRadius.circular(12))),
                cursorColor: AppColors.secondaryGreen,
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextField(
                  obscureText: !controller.isPasswordVisible.value,
                  style: TextStyle(color: AppColors.silver),
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: AppColors.silver),
                      filled: true,
                      fillColor: AppColors.silver.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.secondaryGreen,
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.toggle();
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryGreen),
                          borderRadius: BorderRadius.circular(12))),
                  cursorColor: AppColors.secondaryGreen,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (val) {
                            controller.rememberMe.value = val!;
                          },
                          activeColor: AppColors.primaryGreen,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: AppColors.silver),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.silver),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed('/signup');
                },
                child: Center(
                  child: Text(
                    "New to PayMaster?  Signup",
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
