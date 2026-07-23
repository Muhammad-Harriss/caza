// lib/features/messages/search/viewmodel/search_result_viewmodel.dart
import 'package:caza/features/messages/search/model/media_iteam_model.dart';
import 'package:get/get.dart';
import '../model/search_result_model.dart';
import '../model/message_search_result_model.dart';

import '../model/link_preview_model.dart';

class SearchResultViewModel extends GetxController {
  final RxString query = ''.obs;
  final RxInt tabIndex = 0.obs; // 0=Employee, 1=Messages, 2=Media, 3=Links

  final List<SearchResultModel> _allEmployees = const [
    SearchResultModel(name: 'Alexander', email: 'alexander@caza.com', imagePath: 'assets/images/NM1.jpg'),
    SearchResultModel(name: 'August Hilton', email: 'augusthilton@caza.com', imagePath: 'assets/images/NM2.jpg'),
    SearchResultModel(name: 'Josh Eigner', email: 'josheigner@caza.com', imagePath: 'assets/images/NM3.jpg'),
    SearchResultModel(name: 'Noelle Norman', email: 'noellenorman@caza.com', imagePath: 'assets/images/NM4.jpg'),
    SearchResultModel(name: 'Nicolas Huge', email: 'nicolashuge@caza.com', imagePath: 'assets/images/NM5.jpg'),
    SearchResultModel(name: 'Viona Scylla', email: 'vionascylla@caza.com', imagePath: 'assets/images/NM6.jpg'),
  ];

  final List<MessageSearchResultModel> _allMessages = const [
    MessageSearchResultModel(
      name: 'Noelle Norman',
      imagePath: 'assets/images/NM4.jpg',
      messagePreview: 'May I Help you?',
    ),
  ];

  final List<MediaItemModel> media = const [
    MediaItemModel(imagePath: 'assets/images/search_1.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_2.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_3.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_4.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_5.jpg', isVideo: true),
    MediaItemModel(imagePath: 'assets/images/search_6.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_7.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_8.jpg'),
    MediaItemModel(imagePath: 'assets/images/search_9.jpg', isVideo: true),
  ];

  // Placeholder link previews until backend link search exists
  final List<LinkPreviewModel> links = const [
    LinkPreviewModel(
      imagePath: 'assets/images/search_1.jpg',
      source: 'Youtube',
      title: 'How to make design system',
      description: 'Learn to make a Design System is more important for UI Designer',
    ),
    LinkPreviewModel(
      imagePath: 'assets/images/search_2.jpg',
      source: 'UX Case',
      title: 'Learn UX Design',
      description: 'Learn UX Design. Master the principles and practices of...',
    ),
  ];

  List<SearchResultModel> get filteredEmployees {
    if (query.value.isEmpty) return [];
    return _allEmployees
        .where((e) => e.name.toLowerCase().contains(query.value.toLowerCase()))
        .toList();
  }

  List<MessageSearchResultModel> get filteredMessages {
    if (query.value.isEmpty) return [];
    return _allMessages
        .where((m) =>
            m.messagePreview.toLowerCase().contains(query.value.toLowerCase()))
        .toList();
  }

  void onQueryChanged(String value) {
    query.value = value;
  }

  void switchTab(int index) {
    tabIndex.value = index;
  }

  void onMediaTap(MediaItemModel item) {
    
  }

  void onLinkTap(LinkPreviewModel link) {
   
  }

  void goBack() {
    Get.back();
  }
}