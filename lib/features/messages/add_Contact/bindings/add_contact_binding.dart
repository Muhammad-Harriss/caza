// lib/features/home/add_contact/bindings/add_contact_binding.dart
import 'package:get/get.dart';
import '../viewmodel/add_contact_viewmodel.dart';

class AddContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContactViewModel>(() => AddContactViewModel());
  }
}