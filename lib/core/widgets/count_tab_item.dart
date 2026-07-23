// lib/core/widgets/count_tab_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountTabItem extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  const CountTabItem({
    super.key,
    required this.label,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF444CE7) : const Color(0xFF667085);
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '$label ($count)',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20 / 14,
          color: color,
        ),
      ),
    );
  }
}