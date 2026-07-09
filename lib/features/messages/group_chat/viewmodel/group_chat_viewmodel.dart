// lib/features/messages/group_chat/viewmodel/group_chat_viewmodel.dart
import 'package:get/get.dart';

class GroupChatViewModel extends GetxController {
  late final String groupName;
  late final String groupImagePath;
  final RxString draftText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      groupName = args['groupName'] as String? ?? "Chit Chat's Group";
      groupImagePath =
          args['groupImagePath'] as String? ?? 'assets/images/group_chat.jpg';
    } else {
      groupName = "Chit Chat's Group";
      groupImagePath = 'assets/images/group_chat.jpg';
    }
  }

  void onDraftChanged(String value) {
    draftText.value = value;
  }

  void sendMessage() {
    if (draftText.value.trim().isEmpty) return;
    
    draftText.value = '';
  }

  void addMembers() {
    
  }

  void copyInviteLink() {
    
  }

  void goBack() {
    Get.back();
  }

  void openGroupInfo() {
    
  }
}