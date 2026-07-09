// lib/features/messages/new_group/bindings/new_group_binding.dart
import 'package:caza/features/messages/new_group/view_model/new_group_view_model.dart';
import 'package:get/get.dart';

class NewGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewGroupViewModel>(() => NewGroupViewModel());
  }
}