import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/two_fa_controller.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class TwoFaScreen extends GetView<TwoFaController> {
  const TwoFaScreen({super.key});

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

              SvgPicture.asset(
                'assets/images/CazaLogo.svg',
                width: 224.93,
                height: 56,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

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

              SizedBox(
                width: 346,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: SizedBox(
                        width: 343,
                        child: Text(
                          'Login with your Email Address',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 24 / 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: SizedBox(
                        width: 343,
                        child: Text(
                          'We sent a verification code to your email. Enter the code from the email in the field below',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.0,
                            color: const Color(0xFFA0A0AB),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── OTP Boxes — 8 digits, compact width to fit screen ────
                    Center(
                      child: SizedBox(
                        width: 343,
                        height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(8, (index) {
                            return Obx(() => SizedBox(
                                  width: 36,
                                  height: 52,
                                  child: TextField(
                                    controller:
                                        controller.otpControllers[index],
                                    focusNode: controller.focusNodes[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.textPrimary,
                                    ),
                                    onChanged: (value) =>
                                        controller.onDigitChanged(
                                            index, value),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      fillColor: AppColors.bgWhite,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: controller.otpError.value
                                                  .isNotEmpty
                                              ? AppColors.error
                                              : AppColors.border,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: controller.otpError.value
                                                  .isNotEmpty
                                              ? AppColors.error
                                              : AppColors.border,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: AppColors.borderFocus,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Obx(() {
                      if (controller.otpError.value.isNotEmpty) {
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF3F2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              controller.otpError.value,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFB42318),
                              ),
                            ),
                          ),
                        );
                      }

                      if (controller.isExpired.value) {
                        return Center(
                          child: GestureDetector(
                            onTap: controller.resendOtp,
                            child: Text(
                              'OTP expired. Tap to resend',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        );
                      }

                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3F2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Otp will expire in ${controller.formattedTime}',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFB42318),
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 24),

                    Obx(() => SizedBox(
                          width: 343,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.verifyOtp,
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
                                : Text('Verify My Account',
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