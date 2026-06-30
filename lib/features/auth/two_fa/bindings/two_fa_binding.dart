import 'package:get/get.dart';
import '../controllers/two_fa_controller.dart';

class TwoFaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoFaController>(() => TwoFaController());
  }
}