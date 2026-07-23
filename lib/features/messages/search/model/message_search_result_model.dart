// lib/features/messages/search/model/message_search_result_model.dart
class MessageSearchResultModel {
  final String name;
  final String imagePath;
  final String messagePreview;

  const MessageSearchResultModel({
    required this.name,
    required this.imagePath,
    required this.messagePreview,
  });
}