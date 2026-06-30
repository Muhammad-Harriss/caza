import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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

              // ─── Caza Logo ───────────────────────────────────────────────
              SvgPicture.asset(
                'assets/images/CazaLogo.svg',
                width: 224.93,
                height: 56,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 32),

              // ─── Title Block ─────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  children: [
                    Text(
                      'Welcome back!',
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
                      "We're excited to see you again!",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySm,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ─── Form ────────────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Account Information label
                    Text(
                      'Account Information',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Email Field ─────────────────────────────────────────
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 343,
                          height: 40,
                          child: TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: AppTextStyles.inputText,
                            onChanged: (_) => controller.emailError.value = '',
                            decoration: InputDecoration(
                              hintText: 'Input your email',
                              hintStyle: AppTextStyles.inputHint,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller.emailError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.border,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller.emailError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.border,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller.emailError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.borderFocus,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (controller.emailError.value.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            controller.emailError.value,
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                              color: AppColors.error,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ],
                    )),

                    const SizedBox(height: 12),

                    // ── Password Field ──────────────────────────────────────
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 343,
                          height: 40,
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordHidden.value,
                            style: AppTextStyles.inputText,
                            onChanged: (_) =>
                                controller.passwordError.value = '',
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: AppTextStyles.inputHint,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              suffixIcon: GestureDetector(
                                onTap: controller.togglePassword,
                                child: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 20,
                                  color: AppColors.textHint,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller
                                          .passwordError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.border,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller
                                          .passwordError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.border,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: controller
                                          .passwordError.value.isNotEmpty
                                      ? AppColors.error
                                      : AppColors.borderFocus,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (controller.passwordError.value.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            controller.passwordError.value,
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                              color: AppColors.error,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ],
                    )),

                    const SizedBox(height: 8),

                    // ── Forgot Password ─────────────────────────────────────
                    GestureDetector(
                      onTap: controller.goToForgotPassword,
                      child: Text(
                        'Forgot your password?',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 20 / 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Log In Button ───────────────────────────────────────
                    Obx(() => SizedBox(
                      width: 343,
                      height: 40,
                      child: ElevatedButton(
                        onPressed:
                            controller.isLoading.value ? null : controller.login,
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
                            : Text('Log In', style: AppTextStyles.buttonMd),
                      ),
                    )),
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