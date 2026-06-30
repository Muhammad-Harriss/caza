import 'package:caza/features/auth/signup/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  // Reusable input field builder
  Widget _buildField({
    required TextEditingController textController,
    required String hint,
    required RxString error,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    RxBool? isHidden,
    VoidCallback? onToggle,
    required VoidCallback onChanged,
  }) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 343,
              height: 40,
              child: TextField(
                controller: textController,
                keyboardType: keyboardType,
                obscureText: isPassword ? (isHidden?.value ?? true) : false,
                style: AppTextStyles.inputText,
                onChanged: (_) => onChanged(),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTextStyles.inputHint,
                  filled: true,
                  fillColor: AppColors.bgWhite,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  suffixIcon: isPassword
                      ? GestureDetector(
                          onTap: onToggle,
                          child: Icon(
                            (isHidden?.value ?? true)
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color: AppColors.textHint,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: error.value.isNotEmpty
                          ? AppColors.error
                          : AppColors.border,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: error.value.isNotEmpty
                          ? AppColors.error
                          : AppColors.border,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: error.value.isNotEmpty
                          ? AppColors.error
                          : AppColors.borderFocus,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            if (error.value.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                error.value,
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  color: AppColors.error,
                  height: 1.4,
                ),
              ),
            ],
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              // ─── Logo ────────────────────────────────────────────────────
              SvgPicture.asset(
                'assets/images/CazaLogo.svg',
                width: 224.93,
                height: 56,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

              // ─── Title ───────────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  children: [
                    Text(
                      'Welcome To Caza',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 32 / 24,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "We're excited to see you!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySm,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ─── Form ────────────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Register label
                    Text(
                      'Register',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Email ───────────────────────────────────────────────
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 20 / 12,
                        color: const Color(0xFF3538CD),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildField(
                      textController: controller.emailController,
                      hint: 'nicholashyde@caza.com',
                      error: controller.emailError,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: () => controller.emailError.value = '',
                    ),

                    const SizedBox(height: 20),

                    // ── Phone Number ────────────────────────────────────────
                    Text(
                      'Phone Number',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 20 / 12,
                        color: const Color(0xFF3538CD),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildField(
                      textController: controller.phoneController,
                      hint: '0168128991',
                      error: controller.phoneError,
                      keyboardType: TextInputType.phone,
                      onChanged: () => controller.phoneError.value = '',
                    ),

                    const SizedBox(height: 20),

                    // ── Password ────────────────────────────────────────────
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 20 / 12,
                        color: const Color(0xFF3538CD),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildField(
                      textController: controller.passwordController,
                      hint: '••••••••',
                      error: controller.passwordError,
                      isPassword: true,
                      isHidden: controller.isPasswordHidden,
                      onToggle: controller.togglePassword,
                      onChanged: () => controller.passwordError.value = '',
                    ),

                    const SizedBox(height: 20),

                    // ── Confirm Password ────────────────────────────────────
                    Text(
                      'Confirm Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 20 / 12,
                        color: const Color(0xFF3538CD),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildField(
                      textController: controller.confirmPasswordController,
                      hint: '••••••••',
                      error: controller.confirmPasswordError,
                      isPassword: true,
                      isHidden: controller.isConfirmPasswordHidden,
                      onToggle: controller.toggleConfirmPassword,
                      onChanged: () =>
                          controller.confirmPasswordError.value = '',
                    ),

                    const SizedBox(height: 24),

                    // ── Sign Up Button ──────────────────────────────────────
                    Obx(() => SizedBox(
                          width: 343,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.signUp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.textOnBrand,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                            ),
                            child: controller.isLoading.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'Sign Up',
                                    style: AppTextStyles.buttonMd,
                                  ),
                          ),
                        )),

                    const SizedBox(height: 20),

                    // ── Already have account ────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?  ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 20 / 14,
                            color: AppColors.textDark,
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.goToLogin,
                          child: Text(
                            'Log In',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 20 / 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}