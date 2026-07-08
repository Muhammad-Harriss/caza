// lib/features/messages/chat/bindings/chat_binding.dart
import 'package:get/get.dart';
import '../viewmodel/chat_viewmodel.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatViewModel>(() => ChatViewModel());
  }
}