import 'package:caza/features/auth/forgot_password/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

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
              const SizedBox(height: 53),

              // ─── Logo — w: 224.93 | h: 56 ───────────────────────────────
              SvgPicture.asset(
                'assets/images/CazaLogo.svg',
                width: 224.93,
                height: 56,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 22),

              // ─── Title Block — w: 343 | h: 60 | gap: 8 ──────────────────
              SizedBox(
                width: 343,
                child: Column(
                  children: [
                    // Welcome To Caza — Montserrat Bold 24px | #101828
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

                    // We're excited to see you again! — Montserrat Regular 12px | #475467
                    Text(
                      "We're excited to see you again!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 20 / 12,
                        color: const Color(0xFF475467),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ─── Form Block ──────────────────────────────────────────────
              SizedBox(
                width: 343,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Forgot Password? — Montserrat SemiBold 14px | #101828
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Email label — Poppins SemiBold 12px | #3538CD
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

                    // ── Email Field ─────────────────────────────────────────
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 343,
                              height: 40,
                              child: TextField(
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: AppTextStyles.inputText,
                                onChanged: (_) =>
                                    controller.emailError.value = '',
                                decoration: InputDecoration(
                                  hintText: 'Input your email',
                                  hintStyle: AppTextStyles.inputHint,
                                  filled: true,
                                  fillColor: AppColors.bgWhite,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller
                                              .emailError.value.isNotEmpty
                                          ? AppColors.error
                                          : AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller
                                              .emailError.value.isNotEmpty
                                          ? AppColors.error
                                          : AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: controller
                                              .emailError.value.isNotEmpty
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

                    const SizedBox(height: 24),

                    // ── Sign In Button — w: 343 | h: 40 | bg: #444CE7 ───────
                    Obx(() => SizedBox(
                          width: 343,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.sendResetLink,
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
                                : Text('Sign In', style: AppTextStyles.buttonMd),
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