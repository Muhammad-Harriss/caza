// lib/features/messages/search/bindings/search_result_binding.dart
import 'package:get/get.dart';
import '../viewmodel/search_result_viewmodel.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultViewModel>(() => SearchResultViewModel());
  }
}