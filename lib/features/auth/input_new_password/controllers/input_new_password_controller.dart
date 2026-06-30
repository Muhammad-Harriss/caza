import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class InputNewPasswordController extends GetxController {
  final passwordController        = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isPasswordHidden        = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;
  final RxBool isLoading               = false.obs;

  final RxString passwordError        = ''.obs;
  final RxString confirmPasswordError = ''.obs;

  void togglePassword() =>
      isPasswordHidden.value = !isPasswordHidden.value;
  void toggleConfirmPassword() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  bool _validate() {
    passwordError.value = '';
    confirmPasswordError.value = '';
    bool valid = true;

    final password = passwordController.text;
    final confirm  = confirmPasswordController.text;

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      valid = false;
    }

    if (confirm.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      valid = false;
    } else if (confirm != password) {
      confirmPasswordError.value = 'Passwords do not match';
      valid = false;
    }

    return valid;
  }

  Future<void> changePassword() async {
    if (!_validate()) return;

    try {
      isLoading.value = true;

      // Updates the password for the active recovery session
      await SupabaseService.auth.updateUser(
        UserAttributes(password: passwordController.text),
      );

      Get.offNamed(AppRoutes.passwordChangedSuccess);
    } on AuthException catch (e) {
      _handleAuthError(e.message);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFFEF3F2),
        colorText: const Color(0xFFB42318),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _handleAuthError(String message) {
    final msg = message.toLowerCase();
    if (msg.contains('password')) {
      passwordError.value = message;
    } else if (msg.contains('session') || msg.contains('expired')) {
      Get.snackbar(
        'Session Expired',
        'Please restart the password reset process.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
      Get.offAllNamed(AppRoutes.login);
    } else {
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}