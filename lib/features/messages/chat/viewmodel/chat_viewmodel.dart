// lib/features/messages/chat/viewmodel/chat_viewmodel.dart
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import 'package:get/get.dart';
import '../model/message_model.dart';

class ChatViewModel extends GetxController {
  late final ContactModel contact;
  final RxList<MessageModel> messages = <MessageModel>[].obs;
  final RxString draftText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args is ContactModel) {
      contact = args;
    } else {
      // Fallback so the app doesn't crash if opened without a contact
      contact = const ContactModel(
        name: 'Unknown',
        email: '',
        imagePath: 'assets/images/NM1.jpg',
      );
    }

    messages.addAll([
      MessageModel(text: "Hi there! How's it going?", sender: MessageSender.other, time: DateTime.now()),
      MessageModel(text: 'Hey, how are you doing today?', sender: MessageSender.me, time: DateTime.now()),
      MessageModel(text: "Hello! How's your day been so far?", sender: MessageSender.other, time: DateTime.now()),
    ]);
  }

  void onDraftChanged(String value) {
    draftText.value = value;
  }

  void sendMessage() {
    if (draftText.value.trim().isEmpty) return;
    messages.add(MessageModel(
      text: draftText.value.trim(),
      sender: MessageSender.me,
      time: DateTime.now(),
    ));
    draftText.value = '';
  }

  void goBack() {
    Get.back();
  }
}