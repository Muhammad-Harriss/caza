// lib/core/widgets/contact_card.dart
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback? onTap;
  final bool showCheckbox;
  final bool isSelected;

  const ContactCard({
    super.key,
    required this.contact,
    this.onTap,
    this.showCheckbox = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(contact.imagePath),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    contact.name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    contact.email,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 18 / 12,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ],
              ),
            ),
            if (showCheckbox) ...[
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF444CE7) : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF444CE7)
                        : const Color(0xFFD0D5DD),
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}