// lib/features/messages/new_message/bindings/new_message_binding.dart
import 'package:get/get.dart';
import '../viewmodel/new_message_viewmodel.dart';

class NewMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewMessageViewModel>(() => NewMessageViewModel());
  }
}