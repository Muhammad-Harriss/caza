import 'package:get/get.dart';
import '../controllers/input_new_password_controller.dart';

class InputNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputNewPasswordController>(
        () => InputNewPasswordController());
  }
}