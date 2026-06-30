import 'package:caza/features/auth/password_changed_success/controller/password_chagned_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class PasswordChangedSuccessScreen
    extends GetView<PasswordChangedSuccessController> {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),

              // ─── Icon Stack — w: 208 | h: 137.5 | gap: 10 ───────────────
              SizedBox(
                width: 208,
                height: 137.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Confetti background
                    SvgPicture.asset(
                      'assets/images/Confetti.svg',
                      width: 208,
                      height: 137.5,
                      fit: BoxFit.contain,
                    ),

                    // Light blue circle + brand circle + checkmark icon
                    Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryLight,
                          width: 10,
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/Iconly.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ─── Success Text — w: 295 | h: 56 ──────────────────────────
              SizedBox(
                width: 295,
                height: 56,
                child: Text(
                  'Your password already change',
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

              const Spacer(flex: 1),

              // ─── Log In Button ───────────────────────────────────────────
              SizedBox(
                width: 343,
                height: 40,
                child: ElevatedButton(
                  onPressed: controller.goToLogin,
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
                  child: Text('Log In', style: AppTextStyles.buttonMd),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}