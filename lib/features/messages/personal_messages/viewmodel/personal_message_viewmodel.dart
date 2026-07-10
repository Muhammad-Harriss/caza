// lib/features/messages/personal_messages/viewmodel/personal_message_viewmodel.dart
import 'package:caza/app/routes/app_routes.dart';
import 'package:caza/features/messages/new_group/bindings/new_group_binding.dart';
import 'package:caza/features/messages/new_messages/view/new_message_view.dart';
import 'package:caza/features/messages/new_messages/viewmodel/new_message_viewmodel.dart';
import 'package:caza/features/messages/new_group/view/new_group_view.dart';
import 'package:caza/features/messages/personal_messages/model/empty_state_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalMessageViewModel extends GetxController {
  final RxInt bottomNavIndex = 2.obs; 
  final RxInt tabIndex = 0.obs; // 0 = Personal, 1 = Group
  final RxString searchQuery = ''.obs;

  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  void switchTab(int index) {
    tabIndex.value = index;
  }

  void onNavTap(int index) {
    bottomNavIndex.value = index;
    if (index == 0) {
      Get.offNamed(AppRoutes.home);
    }
  }

  void addNewMessage() {
    Get.put(NewMessageViewModel());
    Get.bottomSheet(
      const NewMessageView(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void createGroupChat() {
    // 1. Initialize the dependency binding manually
    NewGroupBinding().dependencies();

    // 2. Open the bottom sheet safely
    Get.bottomSheet(
      const NewGroupView(),
      isScrollControlled: true,
      ignoreSafeArea: false,
      backgroundColor: Colors.transparent,
    );
  }

  EmptyStateContent get emptyStateContent {
    if (tabIndex.value == 0) {
      return const EmptyStateContent(
        imagePath: 'assets/images/Personal_Message.svg',
        title: 'Start your message',
        subtitle: 'Start conversation with other employee in your organization.',
        buttonText: 'Add New Message',
      );
    } else {
      return const EmptyStateContent(
        imagePath: 'assets/images/Personal_Message.svg',
        title: 'Ready for a next level chat?',
        subtitle: 'Make your conversations with divisions or friends more structured and organized',
        buttonText: 'Create Group Chat',
      );
    }
  }
}