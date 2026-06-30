import 'package:caza/features/onbording/controllers/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),

              // Caza Logo — w: 224.93 | h: 56
              SvgPicture.asset(
                'assets/images/CazaLogo.svg',
                width: 224.93,
                height: 56,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 48),

              // Illustration — w: 237 | h: 254
              SvgPicture.asset(
                'assets/images/Illustration.svg',
                width: 237,
                height: 254,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

              // Text block — w: 295 | h: 76 | gap: 8
              SizedBox(
                width: 295,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title — Montserrat Bold 20px | #101828
                    Text(
                      'Welcome to Caza',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h2, // Removed const
                    ),

                    const SizedBox(height: 8),

                    // Subtitle — Montserrat Regular 12px | #475467
                    Text(
                      'Sharing file and Message with other employee more easily.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySm, // Removed const
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Log In Button — w: 343 | h: 40 | radius: 4 | bg: #444CE7
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
                      horizontal: 14,
                      vertical: 10,
                    ),
                  ),
                  child: Text('Log In', style: AppTextStyles.buttonMd), // Removed const
                ),
              ),

              const SizedBox(height: 14),

              // Sign Up row — w: 271 | h: 33
              SizedBox(
                width: 271,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // "Or don't have account ?" — Montserrat SemiBold 14px | #101323
                    Text(
                      "Or don't have account ?  ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.textDark,
                      ),
                    ),

                    // "Sign Up" — Montserrat SemiBold 14px | #444CE7
                    GestureDetector(
                      onTap: controller.goToSignup,
                      child: Text(
                        'Sign Up',
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
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}