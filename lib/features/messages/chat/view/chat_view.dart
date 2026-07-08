// lib/features/messages/chat/view/chat_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/chat_bubble.dart';
import '../viewmodel/chat_viewmodel.dart';

class ChatView extends GetView<ChatViewModel> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ─── Header ─────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: controller.goBack,
                    child: SvgPicture.asset(
                      'assets/images/left_arrow.svg',
                      width: 16,
                      height: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(controller.contact.imagePath),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          controller.contact.name,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 24 / 16,
                            color: const Color(0xFF101828),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          'assets/images/right_arrow.svg',
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/CPD_chat.svg',
                    width: 71,
                    height: 19.12,
                  ),
                ],
              ),
            ),

            // ─── Message list ────────────────────────
            Expanded(
              child: Obx(() => ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    reverse: true,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          controller.messages.length - 1 - index;
                      return ChatBubble(message: controller.messages[reversedIndex]);
                    },
                  )),
            ),

            // ─── Footer input ────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
              child: Row(
                children: [
                  // Plus button
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/images/Plus.svg'),
                  ),
                  const SizedBox(width: 8),

                  // Text field
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: controller.onDraftChanged,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                color: const Color(0xFF101828),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Write message here',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 20 / 14,
                                  color: const Color(0xFF667085),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/Base_Icon.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 6),
                          SvgPicture.asset(
                            'assets/images/smile.svg',
                            width: 16.67,
                            height: 16.67,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Voice / send button
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2F4F7),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/images/voice.svg'),
                    ),
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