import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/input_new_password_controller.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class InputNewPasswordScreen extends GetView<InputNewPasswordController> {
  const InputNewPasswordScreen({super.key});

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

              // ─── Illustration — w: 237 | h: 160 ─────────────────────────
              SvgPicture.asset(
                'assets/images/newpassword.svg',
                width: 237,
                height: 160,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

              // ─── Title — w: 343 | h: 28 ──────────────────────────────────
              SizedBox(
                width: 343,
                height: 28,
                child: Text(
                  'Change Your Password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 28 / 20,
                    letterSpacing: 0,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ─── Form ────────────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // New Password label
                    SizedBox(
                      width: 343,
                      height: 20,
                      child: Text(
                        'New Password',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 20 / 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // ── New Password Field ─────────────────────────────────
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 343,
                              height: 40,
                              child: TextField(
                                controller: controller.passwordController,
                                obscureText:
                                    controller.isPasswordHidden.value,
                                style: AppTextStyles.inputText,
                                onChanged: (_) =>
                                    controller.passwordError.value = '',
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppTextStyles.inputHint,
                                  filled: true,
                                  fillColor: AppColors.bgWhite,
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

                    const SizedBox(height: 20),

                    // Confirm New Password label
                    SizedBox(
                      width: 343,
                      height: 20,
                      child: Text(
                        'Confirm New Password',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 20 / 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // ── Confirm Password Field ──────────────────────────────
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 343,
                              height: 40,
                              child: TextField(
                                controller:
                                    controller.confirmPasswordController,
                                obscureText:
                                    controller.isConfirmPasswordHidden.value,
                                style: AppTextStyles.inputText,
                                onChanged: (_) => controller
                                    .confirmPasswordError.value = '',
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppTextStyles.inputHint,
                                  filled: true,
                                  fillColor: AppColors.bgWhite,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  suffixIcon: GestureDetector(
                                    onTap: controller.toggleConfirmPassword,
                                    child: Icon(
                                      controller
                                              .isConfirmPasswordHidden.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: 20,
                                      color: AppColors.textHint,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller.confirmPasswordError
                                              .value.isNotEmpty
                                          ? AppColors.error
                                          : AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller.confirmPasswordError
                                              .value.isNotEmpty
                                          ? AppColors.error
                                          : AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller.confirmPasswordError
                                              .value.isNotEmpty
                                          ? AppColors.error
                                          : AppColors.borderFocus,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (controller
                                .confirmPasswordError.value.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                controller.confirmPasswordError.value,
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  color: AppColors.error,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ],
                        )),

                    const SizedBox(height: 24),

                    // ── Change Password Button ──────────────────────────────
                    Obx(() => SizedBox(
                          width: 343,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.changePassword,
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
                                : Text('Change Password',
                                    style: AppTextStyles.buttonMd),
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