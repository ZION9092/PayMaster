import 'package:easypay/Admin-side/controllers/admin_signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easypay/theme/appcolors.dart';

class AdminSignupScreen extends StatelessWidget {
  const AdminSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminSignupController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Aboard! 🚀",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Create your admin account to manage payrolls effortlessly.",
                style: TextStyle(fontSize: 16, color: AppColors.silver),
              ),
              const SizedBox(height: 30),

              _buildTextField(controller.fullNameController, "Full Name"),
              const SizedBox(height: 15),

              _buildTextField(controller.emailController, "Email Address"),
              const SizedBox(height: 15),

              _buildTextField(controller.phoneController, "Phone Number"),
              const SizedBox(height: 15),

              _buildTextField(controller.companyController, "Company Name"),
              const SizedBox(height: 15),

              _buildDropdownField(controller),
              const SizedBox(height: 15),

              _buildPasswordField(controller, "Password", true),
              const SizedBox(height: 15),

              _buildPasswordField(controller, "Confirm Password", false),
              const SizedBox(height: 15),

              // Remember Me Checkbox
              Obx(() => CheckboxListTile(
                    title: Text("Remember Me",
                        style: TextStyle(color: AppColors.silver)),
                    value: controller.isRememberMeChecked.value,
                    onChanged: (value) => controller.toggleRememberMe(),
                    activeColor: AppColors.primaryGreen,
                    controlAffinity: ListTileControlAffinity.leading,
                  )),

              const SizedBox(height: 20),

              // Signup Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  }, // Add signup logic
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 20),

              // Navigate to Login
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed('/login');
                  }, // Navigate to login screen
                  child: Text(
                    "Already have an account?   Login",
                    style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.secondaryGreen,
      style: TextStyle(color: AppColors.silver),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.silver),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.silver),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Password Field with Visibility Toggle
  Widget _buildPasswordField(
      AdminSignupController controller, String label, bool isPassword) {
    return Obx(() {
      bool isVisible = isPassword
          ? controller.isPasswordVisible.value
          : controller.isConfirmPasswordVisible.value;
      return TextField(
        controller: isPassword
            ? controller.passwordController
            : controller.confirmPasswordController,
        obscureText: !isVisible,
        cursorColor: AppColors.secondaryGreen,
        style: TextStyle(color: AppColors.silver),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: AppColors.silver),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColors.secondaryGreen),
            onPressed: isPassword
                ? controller.togglePasswordVisibility
                : controller.toggleConfirmPasswordVisibility,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.silver),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }

  // Dropdown Field for Company Size
  Widget _buildDropdownField(AdminSignupController controller) {
    return Obx(() => DropdownButtonFormField<String>(
          value: controller.companySize.value.isNotEmpty
              ? controller.companySize.value
              : null,
          items: [
            "Small (1-10)",
            "Medium (11-50)",
            "Large (51-200)",
            "Enterprise (200+)"
          ]
              .map((size) => DropdownMenuItem(
                  value: size,
                  child: Text(size, style: TextStyle(color: AppColors.silver))))
              .toList(),
          onChanged: (value) => controller.companySize.value = value!,
          dropdownColor: AppColors.backgroundColor,
          decoration: InputDecoration(
            labelText: "Company Size",
            labelStyle: TextStyle(color: AppColors.silver),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.silver),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}
