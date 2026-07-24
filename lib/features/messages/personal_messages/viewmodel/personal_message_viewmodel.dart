// lib/features/messages/personal_messages/viewmodel/personal_message_viewmodel.dart
import 'package:caza/app/routes/app_routes.dart';
import 'package:caza/features/messages/new_group/bindings/new_group_binding.dart';
import 'package:caza/features/messages/new_messages/view/new_message_view.dart';
import 'package:caza/features/messages/new_messages/viewmodel/new_message_viewmodel.dart';
import 'package:caza/features/messages/new_group/view/new_group_view.dart';
import 'package:caza/features/messages/personal_messages/model/conversation_model.dart';
import 'package:caza/features/messages/personal_messages/model/empty_state_content.dart';
import 'package:caza/features/messages/personal_messages/view/widgets/conversation_options_sheet.dart';
import 'package:caza/features/messages/personal_messages/view/widgets/mute_duration_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalMessageViewModel extends GetxController {
  final RxInt bottomNavIndex = 2.obs;
  final RxInt tabIndex = 0.obs; // 0 = Personal, 1 = Group
  final RxString searchQuery = ''.obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<ConversationModel> conversations = <ConversationModel>[].obs;

  final RxSet<String> mutedConversationIds = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadConversations();
  }

  Future<void> loadConversations() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await Future.delayed(const Duration(milliseconds: 200));

      final loadedConversations = const [
        ConversationModel(
          id: '1',
          name: 'Viona Scylla',
          imagePath: 'assets/images/NM6.jpg',
          lastMessage: 'Hai, can you see my work now?',
          timeLabel: '1 min',
          unreadCount: 2,
        ),
        ConversationModel(
          id: '2',
          name: 'Noelle Norman',
          imagePath: 'assets/images/NM4.jpg',
          lastMessage: 'Hi Noelle, can you set my schedule f...',
          timeLabel: '1 min',
          isSentByMe: true,
        ),
        ConversationModel(
          id: '3',
          name: 'August Hilton',
          imagePath: 'assets/images/NM2.jpg',
          lastMessage: "I'm already sent to manager",
          timeLabel: '1 min',
          isMuted: true,
        ),
        ConversationModel(
          id: '4',
          name: 'Alexander',
          imagePath: 'assets/images/NM1.jpg',
          lastMessage: 'You: Can you help me sir?',
          timeLabel: '1 min',
        ),
        ConversationModel(
          id: '5',
          name: 'Nicolas Huge',
          imagePath: 'assets/images/NM5.jpg',
          lastMessage: 'You: Thank you for helping me brother',
          timeLabel: '1 min',
        ),
        ConversationModel(
          id: '6',
          name: 'Josh Eigner',
          imagePath: 'assets/images/NM3.jpg',
          lastMessage: 'Hi Alexs, can you help me?',
          timeLabel: '1 min',
        ),
      ];

      conversations.assignAll(loadedConversations);

      mutedConversationIds.assignAll(
        loadedConversations.where((c) => c.isMuted).map((c) => c.id),
      );
    } catch (e) {
      errorMessage.value = 'Unable to load messages. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  bool get hasConversations => conversations.isNotEmpty;

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

  void toggleFavorite(String id) {
    final index = conversations.indexWhere((c) => c.id == id);
    if (index != -1) {
      final current = conversations[index];
      conversations[index] = current.copyWith(isFavorite: !current.isFavorite);
    }
  }

  void showConversationOptions(ConversationModel conversation) {
    Get.bottomSheet(
      Obx(() {
        // Retrieve current reactive state of the conversation
        final currentConv = conversations.firstWhere(
          (c) => c.id == conversation.id,
          orElse: () => conversation,
        );

        return ConversationOptionsSheet(
          conversation: currentConv,
          isMuted: mutedConversationIds.contains(currentConv.id),
          isFavorite: currentConv.isFavorite,
          onContactInfo: () {
            Get.back();
            // TODO: navigate to contact info screen
          },
          onFavorite: () {
            Get.back();
            toggleFavorite(currentConv.id);
          },
          onMarkAsRead: () {
            Get.back();
            // TODO: mark conversation as read
          },
          onMuteConversation: () {
            Get.back();
            if (mutedConversationIds.contains(currentConv.id)) {
              mutedConversationIds.remove(currentConv.id);
            } else {
              showMuteDurationSheet(currentConv);
            }
          },
        );
      }),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void showMuteDurationSheet(ConversationModel conversation) {
    Get.bottomSheet(
      MuteDurationSheet(
        personName: conversation.name,
        onClose: () => Get.back(),
        onDurationSelected: (duration) {
          Get.back();
          mutedConversationIds.add(conversation.id);
          showConversationOptions(conversation);
        },
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
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
    NewGroupBinding().dependencies();
    Get.bottomSheet(
      const NewGroupView(),
      isScrollControlled: true,
      ignoreSafeArea: false,
      backgroundColor: Colors.transparent,
    );
  }

  void onAskAiTap() {}

  EmptyStateContent get emptyStateContent {
    if (tabIndex.value == 0) {
      return const EmptyStateContent(
        imagePath: 'assets/images/Personal_Message.svg',
        title: 'Start your message',
        subtitle:
            'Start conversation with other employee in your organization.',
        buttonText: 'Add New Message',
      );
    } else {
      return const EmptyStateContent(
        imagePath: 'assets/images/Personal_Message.svg',
        title: 'Ready for a next level chat?',
        subtitle:
            'Make your conversations with divisions or friends more structured and organized',
        buttonText: 'Create Group Chat',
      );
    }
  }
}