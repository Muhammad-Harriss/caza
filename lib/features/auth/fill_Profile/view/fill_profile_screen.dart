import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/fill_profile_controller.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class FillProfileScreen extends GetView<FillProfileController> {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

              // ─── Title ───────────────────────────────────────────────────
              SizedBox(
                width: 343,
                height: 32,
                child: Text(
                  'Fill profile information',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 32 / 24,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // ─── Subtitle ────────────────────────────────────────────────
              SizedBox(
                width: 343,
                height: 20,
                child: Text(
                  'Please fill your profile information first',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 20 / 12,
                    color: const Color(0xFF475467),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ─── Your Email ──────────────────────────────────────────────
              Text(
                'Your Email',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: const Color(0xFF344054),
                ),
              ),
              const SizedBox(height: 4),
              Obx(() => Text(
                    controller.userEmail.value.isEmpty
                        ? '—'
                        : controller.userEmail.value,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xFF98A2B3),
                    ),
                  )),

              const SizedBox(height: 16),

              // ─── Your Phone Number ───────────────────────────────────────
              Text(
                'Your Phone Number',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                  color: const Color(0xFF344054),
                ),
              ),
              const SizedBox(height: 4),
              Obx(() => Text(
                    controller.userPhone.value.isEmpty
                        ? '—'
                        : controller.userPhone.value,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 20 / 14,
                      color: const Color(0xFF98A2B3),
                    ),
                  )),

              const SizedBox(height: 20),

              // ─── Photo Profile ────────────────────────────────────────────
              Text(
                'Photo Profile',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 20 / 14,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Obx(() => GestureDetector(
                    onTap: controller.pickImage,
                    child: Stack(
                      children: [
                        // Avatar circle
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFF2F4F7),
                            border: Border.all(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: controller.profileImageBytes.value != null
                              ? Image.memory(
                                  controller.profileImageBytes.value!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.person_outline_rounded,
                                  size: 36,
                                  color: Color(0xFF98A2B3),
                                ),
                        ),

                        // Edit icon badge
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit_rounded,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 20),

              // ─── First Name ───────────────────────────────────────────────
              Text(
                'First Name',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 20 / 14,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 40,
                        child: TextField(
                          controller: controller.firstNameController,
                          style: AppTextStyles.inputText,
                          onChanged: (_) =>
                              controller.firstNameError.value = '',
                          decoration: InputDecoration(
                            hintText: 'Your first name',
                            hintStyle: AppTextStyles.inputHint,
                            filled: true,
                            fillColor: AppColors.bgWhite,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .firstNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.border,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .firstNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.border,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .firstNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.borderFocus,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (controller.firstNameError.value.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          controller.firstNameError.value,
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: AppColors.error,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  )),

              const SizedBox(height: 16),

              // ─── Last Name ────────────────────────────────────────────────
              Text(
                'Last Name',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 20 / 14,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 343,
                        height: 40,
                        child: TextField(
                          controller: controller.lastNameController,
                          enabled: !controller.noLastName.value,
                          style: AppTextStyles.inputText,
                          onChanged: (_) =>
                              controller.lastNameError.value = '',
                          decoration: InputDecoration(
                            hintText: 'Your last name',
                            hintStyle: AppTextStyles.inputHint,
                            filled: true,
                            fillColor: controller.noLastName.value
                                ? const Color(0xFFF9FAFB)
                                : AppColors.bgWhite,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .lastNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.border,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .lastNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.border,
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                color: AppColors.border,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: controller
                                        .lastNameError.value.isNotEmpty
                                    ? AppColors.error
                                    : AppColors.borderFocus,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (controller.lastNameError.value.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          controller.lastNameError.value,
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: AppColors.error,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  )),

              const SizedBox(height: 12),

              // ─── No Last Name Checkbox ────────────────────────────────────
              Obx(() => GestureDetector(
                    onTap: () => controller
                        .toggleNoLastName(!controller.noLastName.value),
                    child: Row(
                      children: [
                        // Custom checkbox
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: controller.noLastName.value
                                ? AppColors.primary
                                : AppColors.bgWhite,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: controller.noLastName.value
                                  ? AppColors.primary
                                  : AppColors.border,
                              width: 1,
                            ),
                          ),
                          child: controller.noLastName.value
                              ? const Icon(
                                  Icons.check_rounded,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),

                        const SizedBox(width: 10),

                        // Label
                        Text(
                          'Not have last name',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 20 / 14,
                            color: const Color(0xFF344054),
                          ),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 24),

              // ─── Next Button ──────────────────────────────────────────────
              Obx(() => SizedBox(
                    width: 343,
                    height: 40,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textOnBrand,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text('Next', style: AppTextStyles.buttonMd),
                    ),
                  )),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}