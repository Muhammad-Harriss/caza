// lib/features/messages/group_details/bindings/group_details_binding.dart
import 'package:caza/features/messages/group_details/viewmodel/group_detail_viewmodel.dart';
import 'package:get/get.dart';

class GroupDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupDetailsViewModel>(() => GroupDetailsViewModel());
  }
}