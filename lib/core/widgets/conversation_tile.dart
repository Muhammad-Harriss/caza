// lib/core/widgets/conversation_tile.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/messages/personal_messages/model/conversation_model.dart';

class ConversationTile extends StatelessWidget {
  final ConversationModel conversation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ConversationTile({
    super.key,
    required this.conversation,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnread = conversation.unreadCount > 0;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(conversation.imagePath),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Name & Favorite Star Row ─────────────────────
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          conversation.name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 20 / 14,
                            color: const Color(0xFF101828),
                          ),
                        ),
                      ),
                      if (conversation.isFavorite) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFC107), // Yellow Star
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  // ─── Last Message & Muted Icon Row ────────────────
                  Row(
                    children: [
                      if (conversation.isMuted) ...[
                        const Icon(
                          Icons.volume_off,
                          size: 14,
                          color: Color(0xFF98A2B3),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          conversation.isSentByMe
                              ? 'You: ${conversation.lastMessage}'
                              : conversation.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: hasUnread
                                ? FontWeight.w600
                                : FontWeight.w400,
                            fontSize: 12,
                            height: 18 / 12,
                            color: hasUnread
                                ? const Color(0xFF101828)
                                : const Color(0xFF667085),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  conversation.timeLabel,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 14 / 10,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
                const SizedBox(height: 4),
                if (hasUnread)
                  Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF04438),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${conversation.unreadCount}',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}