import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class SignupController extends GetxController {
  final emailController           = TextEditingController();
  final phoneController           = TextEditingController();
  final passwordController        = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isPasswordHidden        = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;
  final RxBool isLoading               = false.obs;

  final RxString emailError           = ''.obs;
  final RxString phoneError           = ''.obs;
  final RxString passwordError        = ''.obs;
  final RxString confirmPasswordError = ''.obs;

  void togglePassword() =>
      isPasswordHidden.value = !isPasswordHidden.value;
  void toggleConfirmPassword() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  void goToLogin() => Get.toNamed(AppRoutes.login);

  bool _validate() {
    bool valid = true;

    // Clear all first
    emailError.value = '';
    phoneError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';

    final email    = emailController.text.trim();
    final phone    = phoneController.text.trim();
    final password = passwordController.text;
    final confirm  = confirmPasswordController.text;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      valid = false;
    }

    if (phone.isEmpty) {
      phoneError.value = 'Phone number is required';
      valid = false;
    } else if (phone.length < 8) {
      phoneError.value = 'Enter a valid phone number';
      valid = false;
    }

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

  Future<void> signUp() async {
    // Run validation first — if fails, stop here
    if (!_validate()) return;

    try {
      isLoading.value = true;

      final response = await SupabaseService.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text,
        data: {
          'phone': phoneController.text.trim(),
        },
      );

      if (response.user != null) {
        Get.snackbar(
          'Account Created!',
          'Please check your email to verify your account.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFF0FDF4),
          colorText: const Color(0xFF15803D),
          margin: const EdgeInsets.all(16),
          borderRadius: 8,
          duration: const Duration(seconds: 4),
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.offNamed(AppRoutes.login);
      }
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
    if (msg.contains('already registered') || msg.contains('already exists')) {
      emailError.value = 'This email is already registered';
    } else if (msg.contains('invalid email')) {
      emailError.value = 'Enter a valid email address';
    } else if (msg.contains('password')) {
      passwordError.value = message;
    } else {
      Get.snackbar(
        'Signup Failed',
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
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}