// lib/features/messages/new_message/viewmodel/new_message_viewmodel.dart
import 'package:caza/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../model/contact_model.dart';

class NewMessageViewModel extends GetxController {
  final RxString searchQuery = ''.obs;

  final List<ContactModel> _allContacts = const [
    ContactModel(name: 'Alexander', email: 'alexander@caza.com', imagePath: 'assets/images/NM1.jpg'),
    ContactModel(name: 'August Hilton', email: 'augusthilton@caza.com', imagePath: 'assets/images/NM2.jpg'),
    ContactModel(name: 'Josh Eigner', email: 'josheigner@caza.com', imagePath: 'assets/images/NM3.jpg'),
    ContactModel(name: 'Noelle Norman', email: 'noellenorman@caza.com', imagePath: 'assets/images/NM4.jpg'),
    ContactModel(name: 'Nicolas Huge', email: 'nicolashuge@caza.com', imagePath: 'assets/images/NM5.jpg'),
    ContactModel(name: 'Viona Scylla', email: 'vionascylla@caza.com', imagePath: 'assets/images/NM6.jpg'),
  ];

  bool get isSearching => searchQuery.value.isNotEmpty;

  List<ContactModel> get _filteredContacts {
    if (searchQuery.value.isEmpty) return _allContacts;
    return _allContacts
        .where((c) =>
            c.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  /// Groups contacts by first letter of name, e.g. {'A': [...], 'J': [...]}
  Map<String, List<ContactModel>> get groupedContacts {
    final Map<String, List<ContactModel>> grouped = {};
    for (final contact in _filteredContacts) {
      final letter = contact.name[0].toUpperCase();
      grouped.putIfAbsent(letter, () => []).add(contact);
    }
    return grouped;
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
  }

  void onContactTap(ContactModel contact) {
  Get.back();
  Future.delayed(const Duration(milliseconds: 100), () {
    Get.toNamed(AppRoutes.chat, arguments: contact);
  });
}

  void close() {
  
    Get.back();
  }
}