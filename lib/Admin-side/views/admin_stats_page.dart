import 'package:flutter/material.dart';
import 'package:easypay/theme/appcolors.dart';
import 'package:fl_chart/fl_chart.dart'; // For charts
import 'package:get/get.dart'; // For state management

class AdminStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Payroll Analytics', style: TextStyle(color: AppColors.silver)),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.silver),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKeyMetrics(),
            const SizedBox(height: 20),
            _buildSalaryDistribution(),
            const SizedBox(height: 20),
            _buildDepartmentBreakdown(),
            const SizedBox(height: 20),
            _buildPayrollTrends(),
            const SizedBox(height: 20),
            _buildTaxDeductionAnalysis(),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard('Total Payroll Cost', '\$500K'),
        _buildStatCard('Average Salary', '\$5K'),
        _buildStatCard('Total Employees', '100'),
        _buildStatCard('Payroll Growth', '+5%'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 14, color: AppColors.silver)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryDistribution() {
    return _buildChartContainer(
      title: 'Salary Distribution',
      child: PieChart(
        PieChartData(
          sections: [
            _buildPieChartSection(40, Colors.blue, '50K'),
            _buildPieChartSection(30, Colors.green, '100K'),
            _buildPieChartSection(20, Colors.orange, '150K'),
            _buildPieChartSection(10, Colors.red, '200K+'),
          ],
        ),
      ),
    );
  }

  PieChartSectionData _buildPieChartSection(double value, Color color, String title) {
    return PieChartSectionData(
      value: value,
      color: color,
      title: title,
      radius: 50,
      titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
    );
  }

  Widget _buildDepartmentBreakdown() {
    return _buildChartContainer(
      title: 'Department-wise Breakdown',
      child: BarChart(
        BarChartData(
          barGroups: [
            _buildBarChartGroup(0, 120),
            _buildBarChartGroup(1, 80),
            _buildBarChartGroup(2, 60),
            _buildBarChartGroup(3, 100),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarChartGroup(int x, double y) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: Colors.blue, width: 16)]);
  }

  Widget _buildPayrollTrends() {
  return _buildChartContainer(
    title: 'Payroll Trends Over Time',
    child: LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 100),
              const FlSpot(1, 120),
              const FlSpot(2, 150),
              const FlSpot(3, 130),
            ],
            isCurved: true,
            color: Colors.green, // Corrected this line
            barWidth: 4,
          )
        ],
      ),
    ),
  );
}

  Widget _buildTaxDeductionAnalysis() {
    return _buildChartContainer(
      title: 'Tax & Deduction Analysis',
      child: PieChart(
        PieChartData(
          sections: [
            _buildPieChartSection(50, Colors.purple, 'Taxes'),
            _buildPieChartSection(30, Colors.cyan, 'Insurance'),
            _buildPieChartSection(20, Colors.orange, 'Retirement'),
          ],
        ),
      ),
    );
  }

  Widget _buildChartContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.silver)),
          const SizedBox(height: 10),
          SizedBox(height: 200, child: child),
        ],
      ),
    );
  }
}

