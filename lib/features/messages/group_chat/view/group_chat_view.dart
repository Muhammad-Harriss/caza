// lib/features/messages/group_chat/view/group_chat_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodel/group_chat_viewmodel.dart';

class GroupChatView extends GetView<GroupChatViewModel> {
  const GroupChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ─── App bar ─────────────────────────────
            Container(
              width: double.infinity,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(controller.groupImagePath),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.openGroupInfo,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              controller.groupName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 24 / 16,
                                color: const Color(0xFF101828),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/images/right_arrow.svg',
                            width: 6.67,
                            height: 11.67,
                          ),
                        ],
                      ),
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

            // ─── Body ─────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      // Group avatar
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage(controller.groupImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Group name
                      Text(
                        controller.groupName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 28 / 20,
                          color: const Color(0xFF101828),
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Subtitle
                      Text(
                        "Invite friends whenever you're ready",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 20 / 14,
                          color: const Color(0xFF101828),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ─── Add Members row ──────────────
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                            width: 1,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: controller.addMembers,
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/Add_Person.svg'),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Add Members',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 24 / 16,
                                    color: const Color(0xFF101828),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/right_arrow.svg',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ─── Copy Invite Link row ─────────
                      GestureDetector(
                        onTap: controller.copyInviteLink,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFEAECF0),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/link_icon.svg'),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Copy Invite Link or QR Code',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 24 / 16,
                                        color: const Color(0xFF101828),
                                      ),
                                    ),
                                    Text(
                                      'Invite links expire in 24 hour',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 16 / 12,
                                        color: const Color(0xFF667085),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/right_arrow.svg',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
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