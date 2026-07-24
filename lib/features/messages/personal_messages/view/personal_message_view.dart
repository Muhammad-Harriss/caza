// lib/features/messages/personal_message/view/personal_message_view.dart
import 'package:caza/core/widgets/message_fab_colume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/widgets/conversation_tile.dart';

import '../viewmodel/personal_message_viewmodel.dart';

class PersonalMessageView extends GetView<PersonalMessageViewModel> {
  const PersonalMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // ─── Header ─────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Messages',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 24 / 16,
                          color: const Color(0xFF101828),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.messagesSearch),
                        child: AbsorbPointer(
                          child: AppSearchField(
                              onChanged: controller.onSearchChanged),
                        ),
                      ),
                    ],
                  ),
                ),

                // ─── Tabs: Personal / Group ─────────────
                Obx(() => Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFEAECF0), width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.switchTab(0),
                            child: Text(
                              'Personal',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: controller.tabIndex.value == 0
                                    ? const Color(0xFF444CE7)
                                    : const Color(0xFF667085),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () => controller.switchTab(1),
                            child: Text(
                              'Group',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 20 / 14,
                                color: controller.tabIndex.value == 1
                                    ? const Color(0xFF444CE7)
                                    : const Color(0xFF667085),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

                // ─── Main content: loading / error / list / empty ──
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF444CE7),
                        ),
                      );
                    }

                    if (controller.errorMessage.value.isNotEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.errorMessage.value,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: const Color(0xFF475467),
                                ),
                              ),
                              const SizedBox(height: 16),
                              AppPrimaryButton(
                                text: 'Retry',
                                onPressed: controller.loadConversations,
                                width: 160,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    // Only Personal tab (0) shows real conversation data for now.
                    // Group tab (1) still shows its own empty state.
                    if (controller.tabIndex.value == 0 &&
                        controller.hasConversations) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 100),
                        itemCount: controller.conversations.length,
                        itemBuilder: (context, index) {
                          final conversation =
                              controller.conversations[index];
                          return ConversationTile(
                            conversation: conversation,
                            onTap: () {
                              // TODO: navigate to actual ChatView for this conversation
                            },
                            onLongPress: () => controller
                                .showConversationOptions(conversation),
                          );
                        },
                      );
                    }

                    // Empty state (no conversations yet, or Group tab)
                    final content = controller.emptyStateContent;
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            content.imagePath,
                            width: 240,
                            height: 240,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 295,
                            child: Text(
                              content.title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 28 / 20,
                                color: const Color(0xFF101828),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 295,
                            child: Text(
                              content.subtitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 20 / 12,
                                color: const Color(0xFF475467),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          AppPrimaryButton(
                            text: content.buttonText,
                            onPressed: controller.tabIndex.value == 0
                                ? controller.addNewMessage
                                : controller.createGroupChat,
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                // ─── Bottom nav ───────────────────────────
                Obx(() => AppBottomNavBar(
                      currentIndex: controller.bottomNavIndex.value,
                      onTap: controller.onNavTap,
                    )),
              ],
            ),

            // ─── Floating action buttons ───────────────
            // Only show when there's an active conversation list to act upon
            Obx(() {
              if (controller.tabIndex.value != 0 ||
                  !controller.hasConversations) {
                return const SizedBox.shrink();
              }
              return Positioned(
                right: 16,
                bottom: 100,
                child: MessageFabColumn(
                  onAiTap: controller.onAskAiTap,
                  onNewMessageTap: controller.addNewMessage,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}