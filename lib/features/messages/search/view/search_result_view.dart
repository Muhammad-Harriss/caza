// lib/features/messages/search/view/search_result_view.dart

import 'package:caza/core/widgets/link_preview_card.dart';
import 'package:caza/core/widgets/media_grid_title.dart';
import 'package:caza/core/widgets/message_result_card.dart';
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/contact_card.dart';
import '../../../../core/widgets/count_tab_item.dart';
import '../viewmodel/search_result_viewmodel.dart';

class SearchResultView extends GetView<SearchResultViewModel> {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ─── App bar: back + search field ─────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/search.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              onChanged: controller.onQueryChanged,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                color: const Color(0xFF101828),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 20 / 14,
                                  color: const Color(0xFF667085),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ─── Tabs row with counts ─────────────────
            Obx(
              () => Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFEAECF0), width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    CountTabItem(
                      label: 'Employee',
                      count: controller.filteredEmployees.length,
                      isActive: controller.tabIndex.value == 0,
                      onTap: () => controller.switchTab(0),
                    ),
                    const SizedBox(width: 16),
                    CountTabItem(
                      label: 'Messages',
                      count: controller.filteredMessages.length,
                      isActive: controller.tabIndex.value == 1,
                      onTap: () => controller.switchTab(1),
                    ),
                    const SizedBox(width: 16),
                    CountTabItem(
                      label: 'Media',
                      count: controller.media.length,
                      isActive: controller.tabIndex.value == 2,
                      onTap: () => controller.switchTab(2),
                    ),
                    const SizedBox(width: 16),
                    CountTabItem(
                      label: 'Links',
                      count: controller.links.length,
                      isActive: controller.tabIndex.value == 3,
                      onTap: () => controller.switchTab(3),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ─── Results list ──────────────────────────
            Expanded(
              child: Obx(() {
                if (controller.tabIndex.value == 0) {
                  final results = controller.filteredEmployees;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ContactCard(
                          contact: ContactModel(
                            name: result.name,
                            email: result.email,
                            imagePath: result.imagePath,
                          ),
                        ),
                      );
                    },
                  );
                }

                if (controller.tabIndex.value == 1) {
                  final results = controller.filteredMessages;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return MessageResultCard(
                        name: result.name,
                        imagePath: result.imagePath,
                        messagePreview: result.messagePreview,
                        highlightQuery: controller.query.value,
                      );
                    },
                  );
                }

                if (controller.tabIndex.value == 2) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemCount: controller.media.length,
                    itemBuilder: (context, index) {
                      final item = controller.media[index];
                      return MediaGridTile(
                        item: item,
                        onTap: () => controller.onMediaTap(item),
                      );
                    },
                  );
                }

                if (controller.tabIndex.value == 3) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 12,
                      childAspectRatio:
                          0.85, // slightly taller cells tou  fit 2-line titles without clipping
                    ),
                    itemCount: controller.links.length,
                    itemBuilder: (context, index) {
                      final link = controller.links[index];
                      return LinkPreviewCard(
                        link: link,
                        onTap: () => controller.onLinkTap(link),
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
