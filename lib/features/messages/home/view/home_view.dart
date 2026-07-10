// lib/features/home/view/home_view.dart
import 'package:caza/core/widgets/add_action_row.dart';
import 'package:caza/core/widgets/app_bottom_nav_bar.dart';
import 'package:caza/core/widgets/app_search_field.dart';
import 'package:caza/core/widgets/contact_card.dart';
import 'package:caza/core/widgets/group_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ─── Search field ─────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: AppSearchField(
                hintText: 'Search Contact',
                onChanged: controller.onSearchChanged,
              ),
            ),

            // ─── Scrollable content ───────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Groups heading
                    Text(
                      'Groups',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF101828),
                      ),
                    ),
                    const SizedBox(height: 4),

                    ...controller.groups.map(
                      (group) => GroupCard(
                        group: group,
                        onTap: () => controller.onGroupTap(group),
                      ),
                    ),

                    AddActionRow(
                      label: 'Add Group',
                      onTap: controller.addGroup,
                    ),

                    const SizedBox(height: 12),

                    // Contacts heading
                    Text(
                      'Contacts',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 20 / 14,
                        color: const Color(0xFF101828),
                      ),
                    ),
                    const SizedBox(height: 4),

                    ...controller.contacts.map(
                      (contact) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ContactCard(
                          contact: contact,
                          onTap: () => controller.onContactTap(contact),
                        ),
                      ),
                    ),

                    AddActionRow(
                      label: 'New Contact',
                      onTap: controller.addNewContact,
                    ),

                    AddActionRow(
                      label: 'Add teammate',
                      onTap: controller.addTeammate,
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // ─── Bottom nav ───────────────────────────
            Obx(() => AppBottomNavBar(
                  currentIndex: controller.bottomNavIndex.value,
                  onTap: controller.onNavTap,
                )),
          ],
        ),
      ),
    );
  }
}