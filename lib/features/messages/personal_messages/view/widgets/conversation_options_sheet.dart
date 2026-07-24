// lib/features/messages/personal_messages/view/widgets/conversation_options_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/conversation_model.dart';

class ConversationOptionsSheet extends StatelessWidget {
  final ConversationModel conversation;
  final bool isMuted;
  final bool isFavorite;
  final VoidCallback onContactInfo;
  final VoidCallback onFavorite;
  final VoidCallback onMarkAsRead;
  final VoidCallback onMuteConversation;

  const ConversationOptionsSheet({
    super.key,
    required this.conversation,
    required this.isMuted,
    required this.isFavorite,
    required this.onContactInfo,
    required this.onFavorite,
    required this.onMarkAsRead,
    required this.onMuteConversation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAECF0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // ─── Person header ─────────────────
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(conversation.imagePath),
              ),
              const SizedBox(width: 8),
              Text(
                conversation.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 24 / 16,
                  color: const Color(0xFF101828),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _OptionCard(
            iconPath: 'assets/images/contact_info.svg',
            label: 'Contact info',
            onTap: onContactInfo,
          ),
          const SizedBox(height: 8),
          _OptionCard(
            iconPath: isFavorite
                ? 'assets/images/stare_icon.svg'
                : 'assets/images/favorite.svg',
            label: isFavorite ? 'Unfavorite' : 'Favorite',
            onTap: onFavorite,
          ),
          const SizedBox(height: 8),
          _OptionCard(
            iconPath: 'assets/images/MarkAsRead.svg',
            label: 'Mark As Read',
            onTap: onMarkAsRead,
          ),
          const SizedBox(height: 8),
          _OptionCard(
            iconPath: isMuted
                ? 'assets/images/Unmute.svg'
                : 'assets/images/Mute.svg',
            label: isMuted ? 'Unmute Conversation' : 'Mute Conversation',
            onTap: onMuteConversation,
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _OptionCard({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 20, height: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 20 / 14,
                color: const Color(0xFF344054),
              ),
            ),
          ],
        ),
      ),
    );
  }
}