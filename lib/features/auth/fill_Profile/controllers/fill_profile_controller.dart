import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/services/supabase_service.dart';

class FillProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController  = TextEditingController();

  final RxBool noLastName       = false.obs;
  final RxBool isLoading        = false.obs;
  final RxString firstNameError = ''.obs;
  final RxString lastNameError  = ''.obs;

  final Rx<Uint8List?> profileImageBytes = Rx<Uint8List?>(null);

  final RxString userEmail = ''.obs;
  final RxString userPhone = ''.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _loadUserData();

    ever(noLastName, (bool val) {
      if (val) {
        lastNameController.text = firstNameController.text;
      } else {
        lastNameController.clear();
      }
    });

    firstNameController.addListener(() {
      if (noLastName.value) {
        lastNameController.text = firstNameController.text;
      }
    });
  }

  void _loadUserData() {
    final user = SupabaseService.currentUser;
    if (user != null) {
      userEmail.value = user.email ?? '';
      userPhone.value = user.userMetadata?['phone']?.toString() ?? '';
    }
  }

  void toggleNoLastName(bool? value) {
    noLastName.value = value ?? false;
    lastNameError.value = '';
  }

  Future<void> pickImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (picked != null) {
        final bytes = await picked.readAsBytes();
        profileImageBytes.value = bytes;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not pick image. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    }
  }

  bool _validate() {
    firstNameError.value = '';
    lastNameError.value  = '';
    bool valid = true;

    if (firstNameController.text.trim().isEmpty) {
      firstNameError.value = 'First name is required';
      valid = false;
    }

    if (!noLastName.value && lastNameController.text.trim().isEmpty) {
      lastNameError.value = 'Last name is required';
      valid = false;
    }

    return valid;
  }

  Future<void> next() async {
    if (!_validate()) return;

    try {
      isLoading.value = true;

      String? avatarUrl;

      if (profileImageBytes.value != null) {
        final userId = SupabaseService.currentUserId;
        final filePath = 'avatars/$userId.jpg';

        await SupabaseService.storage
            .from('avatars')
            .uploadBinary(
              filePath,
              profileImageBytes.value!,
              fileOptions: const FileOptions(
                contentType: 'image/jpeg',
                upsert: true,
              ),
            );

        avatarUrl = SupabaseService.storage
            .from('avatars')
            .getPublicUrl(filePath);
      }

      await SupabaseService.auth.updateUser(
        UserAttributes(
          data: {
            'first_name': firstNameController.text.trim(),
            'last_name': noLastName.value
                ? firstNameController.text.trim()
                : lastNameController.text.trim(),
            'no_last_name': noLastName.value,
            // null-aware: only include avatar_url key if avatarUrl is not null
            'avatar_url': ?avatarUrl,
            'profile_completed': true,
          },
        ),
      );

      Get.offAllNamed(AppRoutes.home);
    } on StorageException catch (e) {
      Get.snackbar(
        'Upload Failed',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } on AuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 8,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}