// lib/core/widgets/labeled_text_field.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 21 / 16,
              letterSpacing: -0.33,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            keyboardType: keyboardType,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFFD0D5DD),
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}