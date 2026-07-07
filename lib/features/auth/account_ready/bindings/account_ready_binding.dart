import 'package:caza/features/auth/account_ready/bindings/controllers/account_ready_controller.dart';
import 'package:get/get.dart';

class AccountReadyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountReadyController>(() => AccountReadyController());
  }
}