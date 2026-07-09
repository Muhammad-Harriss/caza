// lib/features/messages/new_group/viewmodel/new_group_viewmodel.dart
import 'package:caza/app/routes/app_routes.dart';
import 'package:caza/features/messages/new_messages/model/contact_model.dart';
import 'package:get/get.dart';

class NewGroupViewModel extends GetxController {
  final RxString searchQuery = ''.obs;
  final RxSet<String> selectedEmails = <String>{}.obs;

  final List<ContactModel> _allContacts = const [
    ContactModel(
      name: 'Alexander',
      email: 'alexander@caza.com',
      imagePath: 'assets/images/NM1.jpg',
    ),
    ContactModel(
      name: 'August Hilton',
      email: 'augusthilton@caza.com',
      imagePath: 'assets/images/NM2.jpg',
    ),
    ContactModel(
      name: 'Josh Eigner',
      email: 'josheigner@caza.com',
      imagePath: 'assets/images/NM3.jpg',
    ),
    ContactModel(
      name: 'Noelle Norman',
      email: 'noellenorman@caza.com',
      imagePath: 'assets/images/NM4.jpg',
    ),
    ContactModel(
      name: 'Nicolas Huge',
      email: 'nicolashuge@caza.com',
      imagePath: 'assets/images/NM5.jpg',
    ),
    ContactModel(
      name: 'Viona Scylla',
      email: 'vionascylla@caza.com',
      imagePath: 'assets/images/NM6.jpg',
    ),
  ];

  bool get isSearching => searchQuery.value.isNotEmpty;

  bool get hasSelection => selectedEmails.isNotEmpty;

  List<ContactModel> get _filteredContacts {
    if (searchQuery.value.isEmpty) return _allContacts;
    return _allContacts
        .where(
          (c) => c.name.toLowerCase().contains(searchQuery.value.toLowerCase()),
        )
        .toList();
  }

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

  void toggleSelection(ContactModel contact) {
    if (selectedEmails.contains(contact.email)) {
      selectedEmails.remove(contact.email);
    } else {
      selectedEmails.add(contact.email);
    }
  }

  void createGroup() {
    if (!hasSelection) return;
    final selectedContacts = _allContacts
        .where((c) => selectedEmails.contains(c.email))
        .toList();
    Get.back(); // close the New Group sheet
    Get.toNamed(AppRoutes.groupDetails, arguments: selectedContacts);
  }

  void close() {
    Get.back();
  }
}
