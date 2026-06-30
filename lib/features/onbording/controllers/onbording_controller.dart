import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  void goToLogin()  => Get.toNamed(AppRoutes.login);
  void goToSignup() => Get.toNamed(AppRoutes.signup);
}