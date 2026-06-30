import 'package:caza/features/auth/password_changed_success/controller/password_chagned_success_controller.dart';
import 'package:get/get.dart';

class PasswordChangedSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordChangedSuccessController>(
        () => PasswordChangedSuccessController());
  }
}