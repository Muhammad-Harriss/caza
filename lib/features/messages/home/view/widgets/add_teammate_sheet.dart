// lib/features/home/view/widgets/add_teammate_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTeammateSheet extends StatelessWidget {
  final VoidCallback onShareLink;
  final VoidCallback onAddFromContacts;
  final VoidCallback onAddByEmail;

  const AddTeammateSheet({
    super.key,
    required this.onShareLink,
    required this.onAddFromContacts,
    required this.onAddByEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Invite people to join Caza',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              height: 26 / 18,
              color: const Color(0xFF101828),
            ),
          ),
          const SizedBox(height: 24),
          _TeammateOptionCard(
            iconPath: 'assets/images/share_icon.svg',
            label: 'Share a link',
            onTap: onShareLink,
          ),
          const SizedBox(height: 12),
          _TeammateOptionCard(
            iconPath: 'assets/images/Add_contact_icon.svg',
            label: 'Add from Contacts',
            onTap: onAddFromContacts,
          ),
          const SizedBox(height: 12),
          _TeammateOptionCard(
            iconPath: 'assets/images/Add_email_icon.png',
            label: 'Add by Email',
            onTap: onAddByEmail,
            isPng: true,
          ),
        ],
      ),
    );
  }
}

class _TeammateOptionCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  final bool isPng;

  const _TeammateOptionCard({
    required this.iconPath,
    required this.label,
    required this.onTap,
    this.isPng = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB), // Clean gray card color
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFEAECF0), // Fine subtle border
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPng
                ? Image.asset(iconPath, width: 20, height: 20)
                : SvgPicture.asset(iconPath, width: 20, height: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: const Color(0xFF101828),
              ),
            ),
          ],
        ),
      ),
    );
  }
}