// lib/features/home/add_contact/view/add_contact_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../viewmodel/add_contact_viewmodel.dart';

class AddContactView extends GetView<AddContactViewModel> {
  const AddContactView({super.key});

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
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                    child: Text(
                      'New Contact',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 24 / 16,
                        color: const Color(0xFF101828),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.openQrCode,
                    child: SvgPicture.asset(
                      'assets/images/Qrcode.svg',
                      width: 22,
                      height: 22,
                    ),
                  ),
                ],
              ),
            ),

            // ─── Scrollable form ────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─── Profile image picker ─────────
                    Center(
                      child: GestureDetector(
                        onTap: controller.pickProfileImage,
                        child: Obx(() {
                          final bytes = controller.profileImageBytes.value;
                          return Stack(
                            children: [
                              Container(
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFF2F4F7),
                                  image: bytes != null
                                      ? DecorationImage(
                                          image: MemoryImage(bytes),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: bytes == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 40,
                                        color: Color(0xFF98A2B3),
                                      )
                                    : null,
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF444CE7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 32),

                    LabeledTextField(
                      label: 'Name',
                      hintText: 'First Name',
                      onChanged: controller.onFirstNameChanged,
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Color(0xFFEAECF0), height: 1),
                    const SizedBox(height: 16),
                    LabeledTextField(
                      label: '',
                      hintText: 'Last Name',
                      onChanged: controller.onLastNameChanged,
                    ),

                    const SizedBox(height: 32),

                    LabeledTextField(
                      label: 'Phone',
                      hintText: '',
                      onChanged: (_) {},
                    ),
                    const SizedBox(height: 16),
                    LabeledTextField(
                      label: 'Mobile',
                      hintText: 'Mobile number',
                      keyboardType: TextInputType.phone,
                      onChanged: controller.onMobileChanged,
                    ),

                    const SizedBox(height: 32),

                    LabeledTextField(
                      label: 'Email',
                      hintText: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.onEmailChanged,
                    ),
                  ],
                ),
              ),
            ),

            // ─── Save button pinned at bottom ────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
              ),
              child: AppPrimaryButton(
                text: 'Save',
                onPressed: controller.saveContact,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}