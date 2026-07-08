import 'package:caza/app/routes/app_routes.dart';
import 'package:get/get.dart';


class AccountReadyController extends GetxController {
  void goToLogin() {
    Get.offAllNamed(AppRoutes.personalMessage);
  }
}