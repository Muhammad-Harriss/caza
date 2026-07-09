// lib/features/messages/group_chat/bindings/group_chat_binding.dart
import 'package:get/get.dart';
import '../viewmodel/group_chat_viewmodel.dart';

class GroupChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupChatViewModel>(() => GroupChatViewModel());
  }
}