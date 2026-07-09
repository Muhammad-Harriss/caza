// lib/features/messages/new_group/view/new_group_view.dart
import 'package:caza/features/messages/new_group/view_model/new_group_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../../../../core/widgets/contact_card.dart';


class NewGroupView extends GetView<NewGroupViewModel> {
  const NewGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                const SizedBox(height: 12),

                // ─── Header: close + title + create ─────
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'New Group',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 20 / 14,
                          color: const Color(0xFF101828),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: controller.close,
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: Color(0xFF101828),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() => GestureDetector(
                              onTap: controller.hasSelection
                                  ? controller.createGroup
                                  : null,
                              child: Text(
                                'Create',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 20 / 14,
                                  color: controller.hasSelection
                                      ? const Color(0xFF444CE7)
                                      : const Color(0xFFD0D5DD),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),

                // ─── Search field ────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppSearchField(onChanged: controller.onSearchChanged),
                ),

                const SizedBox(height: 12),

                // ─── Grouped contact list with checkboxes ─
                Expanded(
                  child: Obx(() {
                    final grouped = controller.groupedContacts;
                    final letters = grouped.keys.toList()..sort();
                    final isSearching = controller.isSearching;

                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        if (isSearching)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Search Result',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 20 / 14,
                                color: const Color(0xFF101828),
                              ),
                            ),
                          ),
                        for (final letter in letters) ...[
                          if (!isSearching)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                letter,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: const Color(0xFF667085),
                                ),
                              ),
                            ),
                          ...grouped[letter]!.map((contact) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Obx(() => ContactCard(
                                      contact: contact,
                                      showCheckbox: true,
                                      isSelected: controller.selectedEmails
                                          .contains(contact.email),
                                      onTap: () =>
                                          controller.toggleSelection(contact),
                                    )),
                              )),
                        ],
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}