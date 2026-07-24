// lib/features/messages/contact_info/viewmodel/contact_info_viewmodel.dart
import 'package:get/get.dart';
import '../../personal_messages/model/conversation_model.dart';

class ContactInfoViewModel extends GetxController {
  final RxString userName = 'Alexander'.obs;
  final RxString phoneNumber = '06287919201'.obs;
  final RxString email = 'alexander@gmail.com'.obs;
  String userImagePath = 'assets/images/NM1.jpg';

  @override
  void onInit() {
    super.onInit();
    // Accept conversation object passed through arguments if available
    if (Get.arguments != null && Get.arguments is ConversationModel) {
      final ConversationModel model = Get.arguments;
      userName.value = model.name;
      userImagePath = model.imagePath;
    }
  }

  void onAudioCallTap() {
    // Implement Audio Call logic
  }

  void onVideoCallTap() {
    // Implement Video Call logic
  }

  void onSearchTap() {
    // Implement Search logic
  }

  void onNotificationsTap() {
    // Implement Notifications toggle logic
  }

  void onStarredMessagesTap() {
    // Navigate to Starred Messages
  }

  void onClearChatTap() {
    // Clear chat conversation logic
  }

  void onBlockTap() {
    // Block user logic
  }

  void onReportTap() {
    // Report user logic
  }
}