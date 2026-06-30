import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class LoginController extends GetxController {
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();
  final formKey            = GlobalKey<FormState>();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isLoading        = false.obs;

  // Field error messages
  final RxString emailError    = ''.obs;
  final RxString passwordError = ''.obs;

  void togglePassword() =>
      isPasswordHidden.value = !isPasswordHidden.value;

  void goToSignup() => Get.toNamed(AppRoutes.signup);
  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);

  bool _validate() {
    bool valid = true;

    // Clear all first so old errors don't persist between attempts
    emailError.value = '';
    passwordError.value = '';

    final email    = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      valid = false;
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      valid = false;
    }

    return valid;
  }

  Future<void> login() async {
    if (!_validate()) return;

    try {
      isLoading.value = true;

      final response = await SupabaseService.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (response.user != null) {
        Get.offAllNamed(AppRoutes.home);
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
    if (msg.contains('invalid login') || msg.contains('invalid credentials')) {
      emailError.value = 'Incorrect email or password';
      passwordError.value = 'Incorrect email or password';
    } else if (msg.contains('email not confirmed')) {
      emailError.value = 'Please verify your email first';
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
        'Login Failed',
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
    passwordController.dispose();
    super.onClose();
  }
}