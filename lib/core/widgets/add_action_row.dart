// lib/core/widgets/add_action_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddActionRow extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const AddActionRow({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/Plus.svg',
              width: 15,
              height: 15,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 20 / 14,
                color: const Color(0xFF101828),
              ),
            ),
          ],
        ),
      ),
    );
  }
}