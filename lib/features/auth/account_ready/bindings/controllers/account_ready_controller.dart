import 'package:caza/app/routes/app_routes.dart';
import 'package:caza/core/services/supabase_service.dart';
import 'package:get/get.dart';


class AccountReadyController extends GetxController {
  Future<void> goToLogin() async {
    // Sign out current session so user logs in fresh
    await SupabaseService.auth.signOut();
    Get.offAllNamed(AppRoutes.login);
  }
}