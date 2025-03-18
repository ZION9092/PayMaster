import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:easypay/theme/appcolors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/onboard1.png",
      "title": "Seamless Salary Disbursement",
      "body": "Manage employee payments efficiently with just a few taps."
    },
    {
      "image": "assets/images/onboard2.png",
      "title": "Smart Payroll Insights",
      "body": "Get real-time analytics on salary payouts and transactions."
    },
    {
      "image": "assets/images/onboard3.png",
      "title": "Secure & Efficient Transactions",
      "body": "Enjoy high-level security and fast transactions with PayMaster."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(
                _pages[index]["image"]!,
                _pages[index]["title"]!,
                _pages[index]["body"]!,
              );
            },
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: _pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryGreen,
                    dotColor: AppColors.silver,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                  ),
                ),
                const SizedBox(height: 20),
                _currentIndex == _pages.length - 1
                    ? ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String image, String title, String body) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image, width: 300),
        const SizedBox(height: 40),
        Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryGreen),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          body,
          style: TextStyle(fontSize: 16, color: AppColors.silver),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
