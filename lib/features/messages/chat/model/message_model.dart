// lib/features/messages/chat/model/message_model.dart
enum MessageSender { me, other }

class MessageModel {
  final String text;
  final MessageSender sender;
  final DateTime time;

  MessageModel({
    required this.text,
    required this.sender,
    required this.time,
  });
}