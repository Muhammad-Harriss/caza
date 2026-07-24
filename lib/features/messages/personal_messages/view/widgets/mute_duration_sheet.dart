// lib/features/messages/personal_messages/view/widgets/mute_duration_sheet.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MuteDurationSheet extends StatelessWidget {
  final String personName;
  final ValueChanged<String> onDurationSelected;
  final VoidCallback onClose;

  const MuteDurationSheet({
    super.key,
    required this.personName,
    required this.onDurationSelected,
    required this.onClose,
  });

  static const List<String> _options = [
    'For 15 Minutes',
    'For 1 Hour',
    'For 3 Hour',
    'For 8 Hour',
    'For 24 Hour',
    'Until I turn it back on',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header: close + title ─────────
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Mute $personName?',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 24 / 16,
                  color: const Color(0xFF101828),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onClose,
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Color(0xFF101828),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ─── Duration options ───────────────
          ..._options.map(
            (option) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => onDurationSelected(option),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      option,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF101828),
                      ),
                    ),
                  ),
                ),
                if (option != _options.last)
                  const Divider(color: Color(0xFFEAECF0), height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}