import 'package:easypay/Admin-side/settings_page.dart';
import 'package:easypay/Admin-side/views/Home/homescreen.dart';
import 'package:easypay/Admin-side/views/Onboarding/onboarding_screen.dart';
import 'package:easypay/Admin-side/views/Teams/employee_list_screen.dart';
import 'package:easypay/Admin-side/views/auth/admin_login_screen.dart';
import 'package:easypay/Admin-side/views/auth/admin_signup_screen.dart';
import 'package:easypay/Admin-side/views/salary/salary_breakdown_page.dart';
import 'package:easypay/Employee-side/views/profile_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () =>  AdminLoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const AdminSignupScreen()),
    GetPage(name: AppRoutes.home, page: () => Homescreen()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(name: AppRoutes.employees, page: () => EmployeeListScreen(teamName: '', employees: [],)),
    GetPage(name: AppRoutes.salaryManagement, page: () => const SalaryBreakdownPage()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsPage()),
  ];
}
