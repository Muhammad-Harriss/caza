// lib/features/messages/group_details/view/group_details_view.dart
import 'package:caza/features/messages/group_details/viewmodel/group_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class GroupDetailsView extends GetView<GroupDetailsViewModel> {
  const GroupDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Header ─────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                    const SizedBox(width: 12),
                    Text(
                      'New Group',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 24 / 16,
                        color: const Color(0xFF101828),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ─── Camera + Group name row ─────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      child: SvgPicture.asset('assets/images/camera.svg'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: controller.onGroupNameChanged,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 20 / 14,
                          color: const Color(0xFF101828),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Group name (optional)',
                          hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 20 / 14,
                            color: const Color(0xFFD0D5DD),
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

              const SizedBox(height: 24),

              // ─── Group Permissions ────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Group Permissions',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 24 / 16,
                        color: const Color(0xFF101828),
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.openGroupPermissions,
                      child: SvgPicture.asset(
                        'assets/images/setting.svg',
                        width: 20,
                        height: 22.11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ─── Members label ────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Members (${controller.members.length})',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ─── Member avatars row ────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: controller.members
                      .map(
                        (member) => SizedBox(
                          width: 61,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(member.imagePath),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                member.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  height: 24 / 10,
                                  color: const Color(0xFF101828),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: controller.confirmGroupCreation,
        child: Container(
          width: 60,
          height: 53,
          decoration: BoxDecoration(
            color: const Color(0xFF444CE7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/tick.svg',
              width: 22,
              height: 22,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}