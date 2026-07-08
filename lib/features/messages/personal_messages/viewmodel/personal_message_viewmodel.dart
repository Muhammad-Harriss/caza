// lib/features/messages/personal_message/viewmodel/personal_message_viewmodel.dart

import 'package:caza/features/messages/new_messages/view/new_message_view.dart';
import 'package:caza/features/messages/new_messages/viewmodel/new_message_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalMessageViewModel extends GetxController {
  final RxInt bottomNavIndex = 2.obs; // Messages tab active
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
    
  }

  void addNewMessage() {
  Get.put(NewMessageViewModel());
  Get.bottomSheet(
    const NewMessageView(),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
}