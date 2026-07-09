// lib/features/messages/group_details/viewmodel/group_details_viewmodel.dart
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import 'package:get/get.dart';
import 'package:caza/app/routes/app_routes.dart';


class GroupDetailsViewModel extends GetxController {
  late final List<ContactModel> members;
  final RxString groupName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    members = args is List<ContactModel> ? args : [];
  }

  void onGroupNameChanged(String value) {
    groupName.value = value;
  }

  void openGroupPermissions() {
    
  }

  void confirmGroupCreation() {
    final finalGroupName = groupName.value.trim().isEmpty
        ? "Chit Chat's Group"
        : groupName.value.trim();

    Get.offNamed(
      AppRoutes.groupChat,
      arguments: {
        'groupName': finalGroupName,
        'groupImagePath': 'assets/images/group_chat.jpg',
      },
    );
  }

  void goBack() {
    Get.back();
  }
}