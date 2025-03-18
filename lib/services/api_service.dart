import 'dart:convert';
import 'package:easypay/models/employee_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://a404cb5b-fc3a-46d1-a8cc-6f72f08d71db.mock.pstmn.io";

  static Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/employees"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        List<dynamic> employeeList = data["employees"];
        return employeeList.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load employees");
      }
    } catch (e) {
      print("Error fetching employees: $e");
      throw Exception("Error fetching employees");
    }
  }
}
