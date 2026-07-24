// lib/core/widgets/message_fab_column.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageFabColumn extends StatelessWidget {
  final VoidCallback onAiTap;
  final VoidCallback onNewMessageTap;

  const MessageFabColumn({
    super.key,
    required this.onAiTap,
    required this.onNewMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onAiTap,
          child: Container(
            width: 46,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF444CE7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Base_WhiteIcon.svg',
                  width: 20,
                  height: 20,
                ),
                
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onNewMessageTap,
          child: Container(
            width: 46,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF444CE7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/MessageWhite.svg',
                  width: 22,
                  height: 22,
                ),
                Positioned(
                  bottom: 8,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Color(0xFF444CE7),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/plus_white.svg',
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}