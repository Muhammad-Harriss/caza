// lib/features/messages/search/model/media_item_model.dart
class MediaItemModel {
  final String imagePath;
  final bool isVideo;

  const MediaItemModel({
    required this.imagePath,
    this.isVideo = false,
  });
}