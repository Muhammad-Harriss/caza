// lib/features/messages/personal_message/bindings/personal_message_binding.dart
import 'package:caza/features/messages/personal_messages/viewmodel/personal_message_viewmodel.dart';
import 'package:get/get.dart';


class PersonalMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalMessageViewModel>(() => PersonalMessageViewModel());
  }
}