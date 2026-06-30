import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class TwoFaController extends GetxController {
  late final String email;

  final List<TextEditingController> otpControllers =
      List.generate(8, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(8, (_) => FocusNode());

  final RxBool isLoading = false.obs;
  final RxString otpError = ''.obs;

  final RxInt remainingSeconds = 599.obs;
  Timer? _timer;
  final RxBool isExpired = false.obs;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?['email'] ?? '';

    if (email.isEmpty) {
      // Safety net — if this screen was somehow opened without an email,
      // send the user back to forgot password instead of letting it crash silently
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offNamed(AppRoutes.forgotPassword);
      });
      return;
    }

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    remainingSeconds.value = 599;
    isExpired.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        isExpired.value = true;
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = remainingSeconds.value ~/ 60;
    final seconds = remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void onDigitChanged(int index, String value) {
    otpError.value = '';

    if (value.isNotEmpty && index < otpControllers.length - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    if (index == otpControllers.length - 1 && value.isNotEmpty) {
      FocusScope.of(Get.context!).unfocus();
    }
  }

  String get _otpCode => otpControllers.map((c) => c.text).join();

  Future<void> verifyOtp() async {
    if (isExpired.value) {
      otpError.value = 'Your OTP has expired. Please resend.';
      return;
    }

    final code = _otpCode;
    if (code.length < 8) {
      otpError.value = 'Please enter the complete 8-digit code';
      return;
    }

    try {
      isLoading.value = true;
      otpError.value = '';

      final response = await SupabaseService.auth.verifyOTP(
        email: email,
        token: code,
        type: OtpType.recovery,
      );

      // Explicitly check BOTH user and session exist before navigating.
      // This is the only safe confirmation that verification succeeded.
      if (response.user != null && response.session != null) {
        _timer?.cancel();
        // Use offNamed (not offAllNamed) so we don't wipe the whole stack —
        // this keeps navigation predictable and prevents any stray listener
        // from redirecting to onboarding.
        Get.offNamed(AppRoutes.inputPassword);
      } else {
        otpError.value = 'Verification failed. Please try again.';
      }
    } on AuthException catch (e) {
      _handleAuthError(e.message);
    } catch (e) {
      otpError.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void _handleAuthError(String message) {
    final msg = message.toLowerCase();
    if (msg.contains('expired')) {
      otpError.value = 'This code has expired. Please resend.';
      isExpired.value = true;
    } else if (msg.contains('invalid') || msg.contains('token')) {
      otpError.value = 'Incorrect code. Please try again.';
    } else {
      otpError.value = message;
    }
  }

  Future<void> resendOtp() async {
    try {
      isLoading.value = true;
      otpError.value = '';

      await SupabaseService.auth.resetPasswordForEmail(email);

      for (final c in otpControllers) {
        c.clear();
      }
      focusNodes[0].requestFocus();
      _startTimer();

      Get.snackbar(
        'Code Resent',
        'A new verification code has been sent to your email.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFF0FDF4),
        colorText: const Color(0xFF15803D),
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not resend code. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}