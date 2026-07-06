import 'package:caza/features/auth/biometric/controllers/biometic_controller.dart';
import 'package:get/get.dart';

class BiometricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiometricController>(() => BiometricController());
  }
}