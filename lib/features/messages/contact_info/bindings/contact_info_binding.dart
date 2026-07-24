// lib/features/messages/contact_info/binding/contact_info_binding.dart
import 'package:caza/features/messages/contact_info/viewmodel/contact_info_view_model.dart';
import 'package:get/get.dart';


class ContactInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactInfoViewModel>(() => ContactInfoViewModel());
  }
}