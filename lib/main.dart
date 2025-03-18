import 'package:easypay/Admin-side/classes/payslip_page.dart';
import 'package:easypay/Admin-side/views/Home/homescreen.dart';
import 'package:easypay/Admin-side/views/Onboarding/onboarding_screen.dart';
import 'package:easypay/Admin-side/views/Payslip/payslip_screen.dart';
import 'package:easypay/Admin-side/views/Teams/employee_details_page.dart';
import 'package:easypay/Admin-side/views/Teams/employee_list_screen.dart';
import 'package:easypay/Admin-side/settings_page.dart';
import 'package:easypay/Admin-side/views/auth/admin_login_screen.dart';
import 'package:easypay/Admin-side/views/auth/admin_signup_screen.dart';
import 'package:easypay/Employee-side/employee_homepage.dart';
import 'package:easypay/Employee-side/views/employee_dashboard.dart';
import 'package:easypay/utils/app_pagest.dart';
import 'package:easypay/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() => runApp(const PayrollApp());

class PayrollApp extends StatelessWidget {
  const PayrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'PayMaster',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: Homescreen(),
      initialRoute: AppRoutes.home, // Start from splash
      getPages: AppPages.pages, // Register all pages
    );
  }
}

