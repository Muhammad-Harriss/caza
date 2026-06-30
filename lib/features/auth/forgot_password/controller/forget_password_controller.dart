import 'package:caza/features/auth/forgot_password/view/widgets/instruction_sent_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  final RxBool isLoading    = false.obs;
  final RxString emailError = ''.obs;

  bool _validate() {
    emailError.value = '';
    final email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = 'This field is required';
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      return false;
    }
    return true;
  }

  Future<void> sendResetLink() async {
    if (!_validate()) return;

    try {
      isLoading.value = true;

      await SupabaseService.auth.resetPasswordForEmail(
        emailController.text.trim(),
      );

      Get.dialog(
        InstructionSentDialog(
          email: emailController.text.trim(),
          onOkay: () {
            Get.back(); // close dialog
            Get.toNamed(
              AppRoutes.twoFaEmail,
              arguments: {'email': emailController.text.trim()},
            );
          },
        ),
        barrierDismissible: false,
      );
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
    if (msg.contains('not found') || msg.contains('user not found')) {
      emailError.value = 'No account found with this email';
    } else if (msg.contains('too many requests')) {
      Get.snackbar(
        'Too many attempts',
        'Please wait a moment before trying again.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
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
    emailController.dispose();
    super.onClose();
  }
}