import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle h1 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMd = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySm = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 20 / 12,
    letterSpacing: 0,
    color: AppColors.textTertiary,
  );

  static TextStyle labelMd = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle labelSm = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 18 / 12,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );

  static TextStyle buttonMd = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
    color: AppColors.textOnBrand,
  );

  static TextStyle inputText = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.textPrimary,
  );

  static TextStyle inputHint = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: AppColors.textHint,
  );

  static TextStyle caption = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 1.4,
    color: AppColors.textTertiary,
  );
}