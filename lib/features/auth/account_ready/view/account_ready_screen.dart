import 'package:caza/features/auth/account_ready/bindings/controllers/account_ready_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class AccountReadyScreen extends GetView<AccountReadyController> {
  const AccountReadyScreen({super.key});

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

              // ─── Confetti + circles + checkmark ──────────────────────────
              SizedBox(
                width: 208,
                height: 137.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Confetti background
                    Image.asset(
                      'assets/images/Confetti.png',
                      width: 208,
                      height: 137.5,
                      fit: BoxFit.contain,
                    ),

                    // Light blue outer ring
                    Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryLight,
                      ),
                    ),

                    // Brand circle + checkmark
                    Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
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

              // ─── Your account is ready ────────────────────────────────────
              SizedBox(
                width: 295,
                height: 28,
                child: Text(
                  'Your account is ready',
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

              const SizedBox(height: 8),

              // ─── Subtitle ──────────────────────────────────────────────────
              SizedBox(
                width: 295,
                height: 20,
                child: Text(
                  'Tap Log In button below to enter the application.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 20 / 12,
                    letterSpacing: 0,
                    color: const Color(0xFF475467),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // ─── Log In Button ─────────────────────────────────────────────
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