import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionSentDialog extends StatelessWidget {
  final String email;
  final VoidCallback onOkay;

  const InstructionSentDialog({
    super.key,
    required this.email,
    required this.onOkay,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 343,
        padding: const EdgeInsets.only(
          top: 8,
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title — Montserrat SemiBold 18px | #101828
            SizedBox(
              width: 311,
              height: 24,
              child: Text(
                'Instruction Sent',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 24 / 18,
                  color: const Color(0xFF101828),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Body — Montserrat Regular 14px | #667085, email bolded
            SizedBox(
              width: 311,
              height: 60,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'We sent instruction to change your password to ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                    TextSpan(
                      text: email,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                    TextSpan(
                      text:
                          '. please check both your inbox or spam folder',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Okay button
            SizedBox(
              width: 311,
              height: 40,
              child: ElevatedButton(
                onPressed: onOkay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF444CE7),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  'Okay',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 20 / 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}