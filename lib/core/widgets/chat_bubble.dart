// lib/core/widgets/chat_bubble.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../features/messages/chat/model/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.sender == MessageSender.me;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 260),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF444CE7) : const Color(0xFFF2F4F7),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          message.text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.2,
            color: isMe ? Colors.white : const Color(0xFF141414),
          ),
        ),
      ),
    );
  }
}