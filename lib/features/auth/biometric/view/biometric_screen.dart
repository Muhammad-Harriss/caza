import 'package:caza/features/auth/biometric/controllers/biometic_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class BiometricScreen extends GetView<BiometricController> {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Obx(() {
          final state = controller.state.value;

          if (state == BiometricState.verified) {
            return _VerifiedScreen();
          }

          return _BiometricMainScreen(
            state: state,
            onRetry: controller.authenticate,
            onCancel: controller.cancel,
          );
        }),
      ),
    );
  }
}

// ─── Main Biometric Screen ────────────────────────────────────────────────────
class _BiometricMainScreen extends StatelessWidget {
  final BiometricState state;
  final VoidCallback onRetry;
  final VoidCallback onCancel;

  const _BiometricMainScreen({
    required this.state,
    required this.onRetry,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final isNotRecognized = state == BiometricState.notRecognized;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),

          // ─── Logo ──────────────────────────────────────────────────────
          Center(
            child: SvgPicture.asset(
              'assets/images/CazaLogo.svg',
              width: 224.93,
              height: 56,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 48),

          // ─── Verify Your Identity ──────────────────────────────────────
          Text(
            'Verify Your Identity',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              height: 28 / 20,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 8),

          // ─── Subtitle — always same ────────────────────────────────────
          SizedBox(
            width: 289,
            child: Text(
              'Use your Fingerprint to verify your identity',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 28 / 18,
                color: const Color(0xFF101323),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ─── Illustration Stack ────────────────────────────────────────
          // Default:        bioverif.png only
          // Not Recognized: bioverif.png + error.png at top-right corner
          Center(
            child: SizedBox(
              width: 209,
              height: 186,
              child: Stack(
                children: [
                  // Base image — always bioverif.png
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/bioverif.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Error overlay — only shown when not recognized
                  if (isNotRecognized)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Image.asset(
                        'assets/images/error.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 22),

          // ─── Bottom label ──────────────────────────────────────────────
          // Default:        "Touch the fingerprint sensor"
          // Not Recognized: "Not Recognized"
          Text(
            isNotRecognized
                ? 'Not Recognized'
                : 'Touch the fingerprint sensor',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 24 / 16,
              color: const Color(0xFF101323),
            ),
          ),

          // ─── Tap to try again (only when not recognized) ───────────────
          if (isNotRecognized) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: onRetry,
              child: Text(
                'Tap to try again',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          ],

          const Spacer(),

          // ─── Cancel Button — w: 295 | h: 40 ───────────────────────────
          Center(
            child: SizedBox(
              width: 295,
              height: 40,
              child: ElevatedButton(
                onPressed: onCancel,
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
                child: Text('Cancel', style: AppTextStyles.buttonMd),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ─── Verified Screen ──────────────────────────────────────────────────────────
class _VerifiedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 48),

          // ─── Logo ──────────────────────────────────────────────────────
          Center(
            child: SvgPicture.asset(
              'assets/images/CazaLogo.svg',
              width: 224.93,
              height: 56,
              fit: BoxFit.contain,
            ),
          ),

          const Spacer(),

          // ─── Confetti + blue circle + checkmark ────────────────────────
          SizedBox(
            width: 208,
            height: 137.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/Confetti.png',
                  width: 208,
                  height: 137.5,
                  fit: BoxFit.contain,
                ),
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

          // ─── Verified ──────────────────────────────────────────────────
          Text(
            'Verified',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              height: 28 / 20,
              color: AppColors.textPrimary,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}