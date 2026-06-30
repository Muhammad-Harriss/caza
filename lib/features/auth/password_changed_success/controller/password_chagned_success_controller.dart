import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class PasswordChangedSuccessController extends GetxController {
  Future<void> goToLogin() async {
    // Sign out the recovery session so user must log in fresh with new password
    await SupabaseService.auth.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}