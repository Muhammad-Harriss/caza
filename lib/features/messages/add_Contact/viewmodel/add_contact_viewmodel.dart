// lib/features/home/add_contact/viewmodel/add_contact_viewmodel.dart
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:caza/features/messages/new_messages/model/contact_model.dart';

class AddContactViewModel extends GetxController {
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString mobile = ''.obs;
  final RxString email = ''.obs;
  final Rx<Uint8List?> profileImageBytes = Rx<Uint8List?>(null);

  final ImagePicker _picker = ImagePicker();

  void onFirstNameChanged(String value) => firstName.value = value;
  void onLastNameChanged(String value) => lastName.value = value;
  void onMobileChanged(String value) => mobile.value = value;
  void onEmailChanged(String value) => email.value = value;

  Future<void> pickProfileImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      profileImageBytes.value = bytes;
    }
  }

  void openQrCode() {
   
  }

 void saveContact() {
 
  final fullName = '${firstName.value.trim()} ${lastName.value.trim()}'.trim();
  if (fullName.isEmpty) {
   
    return;
  }

  final newContact = ContactModel(
    name: fullName,
    email: email.value.trim().isEmpty ? 'no-email@caza.com' : email.value.trim(),
    imagePath: 'assets/images/NM1.jpg',
  );

 
  Get.back(result: newContact);
}
  void goBack() {
    Get.back();
  }
}