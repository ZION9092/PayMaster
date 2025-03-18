import 'package:easypay/models/employee_model.dart';
import 'package:easypay/services/api_service.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  var isLoading = true.obs;
  var employees = <Employee>[].obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      employees.value = await ApiService.fetchEmployees();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch employees");
    } finally {
      isLoading(false);
    }
  }
}


