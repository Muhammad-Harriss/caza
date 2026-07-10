// lib/features/home/bindings/home_binding.dart
import 'package:get/get.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}