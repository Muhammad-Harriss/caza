// lib/features/messages/contact_info/view/contact_info_view.dart
import 'package:caza/features/messages/contact_info/viewmodel/contact_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfoView extends GetView<ContactInfoViewModel> {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/left_arrow.svg',
            width: 16,
            height: 14,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // ─── Profile Image ───────────────────────────────────────
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  controller.userImagePath,
                  width: 167,
                  height: 153,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 167,
                    height: 153,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ─── Contact Name ────────────────────────────────────────
            Obx(
              () => Text(
                controller.userName.value,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 24 / 18,
                  color: const Color(0xFF101828),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // ─── Phone & Email Row ───────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Phone
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/grey_phone.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.phoneNumber.value,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF101828),
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Email
                Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/grey_email.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => Text(
                    controller.email.value,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF101828),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ─── Action Buttons (Audio, Video, Search) ────────────────
            Container(
              height: 67,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildActionButton(
                    iconPath: 'assets/images/black_phone.svg',
                    label: 'Audio',
                    onTap: controller.onAudioCallTap,
                  ),
                  _buildActionButton(
                    iconPath: 'assets/images/black_vedio_call.svg',
                    label: 'Video',
                    onTap: controller.onVideoCallTap,
                  ),
                  _buildActionButton(
                    iconPath: 'assets/images/search.svg',
                    label: 'Search',
                    onTap: controller.onSearchTap,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ─── Media, links and docs ───────────────────────────────
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Media, links and docs',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: const Color(0xFF101828),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildMediaTile('assets/images/search_1.jpg')),
                const SizedBox(width: 8),
                Expanded(child: _buildMediaTile('assets/images/search_2.jpg')),
                const SizedBox(width: 8),
                Expanded(child: _buildMediaTile('assets/images/search_3.jpg')),
              ],
            ),
            const SizedBox(height: 16),

            const Divider(color: Color(0xFFEAECF0), thickness: 1),

            // ─── Options List (Notifications, Starred Messages) ─────
            _buildOptionTile(
              iconPath: 'assets/images/black_notification.svg',
              title: 'Notifications',
              onTap: controller.onNotificationsTap,
            ),
            _buildOptionTile(
              iconPath: 'assets/images/black_stare.svg',
              title: 'Starred Messages',
              onTap: controller.onStarredMessagesTap,
            ),

            const Divider(color: Color(0xFFEAECF0), thickness: 1),
            const SizedBox(height: 8),

            // ─── Groups in Common ───────────────────────────────────
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Groups in common',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: const Color(0xFF101828),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildGroupTile(
              imagePath: 'assets/images/group_chat.jpg',
              title: 'Ex Developer',
              membersCount: '8 Member',
            ),
            const SizedBox(height: 8),
            _buildGroupTile(
              imagePath: 'assets/images/Home1.jpg',
              title: 'Chit Chat',
              membersCount: '8 Member',
            ),

            const SizedBox(height: 16),
            const Divider(color: Color(0xFFEAECF0), thickness: 1),

            // ─── Bottom Action Tiles ────────────────────────────────
            _buildOptionTile(
              iconPath: 'assets/images/clear_chat.svg',
              title: 'Clear Chat',
              textColor: const Color(0xFF101828),
              onTap: controller.onClearChatTap,
            ),
            Obx(
              () => _buildOptionTile(
                iconPath: 'assets/images/red_Block.svg',
                title: 'Block ${controller.userName.value}',
                textColor: const Color(0xFFD92D20),
                onTap: controller.onBlockTap,
              ),
            ),
            _buildOptionTile(
              iconPath: 'assets/images/red_Report.svg',
              title: 'Report ${controller.userName.value}',
              textColor: const Color(0xFFD92D20),
              onTap: controller.onReportTap,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Action Button
  Widget _buildActionButton({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.phone, size: 22),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: const Color(0xFF101828),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Media Image Tile
  Widget _buildMediaTile(String imagePath) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade200,
            child: const Icon(Icons.image, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // Helper Widget: Option Item
  Widget _buildOptionTile({
    required String iconPath,
    required String title,
    Color textColor = const Color(0xFF101828),
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        iconPath,
        width: 22,
        height: 22,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.star, size: 22, color: textColor),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: textColor,
        ),
      ),
      onTap: onTap,
    );
  }

  // Helper Widget: Group Tile
  Widget _buildGroupTile({
    required String imagePath,
    required String title,
    required String membersCount,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: const Color(0xFF101828),
              ),
            ),
            Text(
              membersCount,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xFF667085),
              ),
            ),
          ],
        ),
      ],
    );
  }
}