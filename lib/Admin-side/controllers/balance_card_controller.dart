import 'package:get/get.dart';

class BalanceController extends GetxController {
  var isBalanceVisible = true.obs;

  void toggleBalance() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }
}



