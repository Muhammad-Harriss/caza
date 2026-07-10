// lib/features/home/model/group_summary_model.dart
class GroupSummaryModel {
  final String name;
  final String imagePath;
  final int memberCount;
  final bool isStarred;

  const GroupSummaryModel({
    required this.name,
    required this.imagePath,
    required this.memberCount,
    this.isStarred = false,
  });
}