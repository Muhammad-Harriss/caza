// lib/core/widgets/message_result_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageResultCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String messagePreview;
  final String highlightQuery;
  final VoidCallback? onTap;

  const MessageResultCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.messagePreview,
    required this.highlightQuery,
    this.onTap,
  });

  List<TextSpan> _buildHighlightedSpans() {
    if (highlightQuery.isEmpty) {
      return [
        TextSpan(
          text: messagePreview,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: const Color(0xFF667085),
          ),
        ),
      ];
    }

    final lowerText = messagePreview.toLowerCase();
    final lowerQuery = highlightQuery.toLowerCase();
    final spans = <TextSpan>[];
    int start = 0;

    while (true) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index == -1) {
        spans.add(TextSpan(
          text: messagePreview.substring(start),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: const Color(0xFF667085),
          ),
        ));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(
          text: messagePreview.substring(start, index),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            color: const Color(0xFF667085),
          ),
        ));
      }
      spans.add(TextSpan(
        text: messagePreview.substring(index, index + highlightQuery.length),
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 20 / 14,
          color: const Color(0xFF101828),
          backgroundColor: const Color(0xFFE0E7FF),
        ),
      ));
      start = index + highlightQuery.length;
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 2),
                  RichText(
                    text: TextSpan(children: _buildHighlightedSpans()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}