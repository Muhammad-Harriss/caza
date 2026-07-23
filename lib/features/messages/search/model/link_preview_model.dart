// lib/features/messages/search/model/link_preview_model.dart
class LinkPreviewModel {
  final String imagePath;
  final String source;
  final String title;
  final String description;

  const LinkPreviewModel({
    required this.imagePath,
    required this.source,
    required this.title,
    required this.description,
  });
}