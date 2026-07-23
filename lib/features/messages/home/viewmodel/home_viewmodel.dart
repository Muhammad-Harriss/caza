// lib/features/home/viewmodel/home_viewmodel.dart
// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:caza/features/messages/new_group/bindings/new_group_binding.dart';
import 'package:caza/features/messages/new_group/view/new_group_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:caza/app/routes/app_routes.dart';
import 'package:caza/features/messages/home/view/widgets/add_teammate_sheet.dart';
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import '../model/group_summary_model.dart';

class HomeViewModel extends GetxController {
  final RxInt bottomNavIndex = 0.obs;
  final RxString searchQuery = ''.obs;

  final List<GroupSummaryModel> groups = const [
    GroupSummaryModel(name: 'Ex Developer', imagePath: 'assets/images/Home1.jpg', memberCount: 8),
    GroupSummaryModel(name: 'Chit Chat', imagePath: 'assets/images/group_chat.jpg', memberCount: 8),
    GroupSummaryModel(name: "Let's Holiday", imagePath: 'assets/images/Home2.jpg', memberCount: 8, isStarred: true),
  ];

  final RxList<ContactModel> contacts = <ContactModel>[
    const ContactModel(name: 'Alexander', email: 'alexander@caza.com', imagePath: 'assets/images/NM1.jpg'),
    const ContactModel(name: 'August Hilton', email: 'augusthilton@caza.com', imagePath: 'assets/images/NM2.jpg'),
    const ContactModel(name: 'Josh Eigner', email: 'josheigner@caza.com', imagePath: 'assets/images/NM3.jpg'),
    const ContactModel(name: 'Noelle Norman', email: 'noellenorman@caza.com', imagePath: 'assets/images/NM4.jpg'),
  ].obs;

  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  void onNavTap(int index) {
    bottomNavIndex.value = index;
    if (index == 2) {
      Get.offNamed(AppRoutes.personalMessage);
    }
  }

  void onGroupTap(GroupSummaryModel group) {}
  void onContactTap(ContactModel contact) {}

  Future<void> addNewContact() async {
    final result = await Get.toNamed(AppRoutes.addContact);
    if (result is ContactModel) {
      contacts.add(result);
    }
  }

  void addGroup() {
    // 1. Initialize the dependency binding manually to prevent "controller not found" errors
    NewGroupBinding().dependencies();

    // 2. Open the bottom sheet layout natively
    Get.bottomSheet(
      const NewGroupView(),
      isScrollControlled: true,
      ignoreSafeArea: false,
      backgroundColor: Colors.transparent,
    );
  }

  void addTeammate() {
    Get.dialog(
      Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: Colors.black.withOpacity(0.1)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: AddTeammateSheet(
                onShareLink: () => Get.back(),
                onAddFromContacts: () => Get.back(),
                onAddByEmail: () => Get.back(),
              ),
            ),
          ),
        ],
      ),
      barrierColor: Colors.transparent,
    );
  }
}