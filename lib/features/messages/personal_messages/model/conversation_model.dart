// lib/features/messages/personal_messages/model/conversation_model.dart

class ConversationModel {
  final String id;
  final String name;
  final String imagePath;
  final String lastMessage;
  final String timeLabel;
  final int unreadCount;
  final bool isMuted;
  final bool isFavorite; // Non-nullable bool
  final bool isSentByMe;

  const ConversationModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.lastMessage,
    required this.timeLabel,
    this.unreadCount = 0,
    this.isMuted = false,
    this.isFavorite = false, // Default value avoids null
    this.isSentByMe = false,
  });

  // If you map from JSON/Database, safely parse null values using `?? false`:
  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      timeLabel: map['timeLabel'] ?? '',
      unreadCount: map['unreadCount'] ?? 0,
      isMuted: map['isMuted'] ?? false,
      isFavorite: map['isFavorite'] ?? false, // Prevents TypeError
      isSentByMe: map['isSentByMe'] ?? false,
    );
  }

  ConversationModel copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? lastMessage,
    String? timeLabel,
    int? unreadCount,
    bool? isMuted,
    bool? isFavorite,
    bool? isSentByMe,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      lastMessage: lastMessage ?? this.lastMessage,
      timeLabel: timeLabel ?? this.timeLabel,
      unreadCount: unreadCount ?? this.unreadCount,
      isMuted: isMuted ?? this.isMuted,
      isFavorite: isFavorite ?? this.isFavorite,
      isSentByMe: isSentByMe ?? this.isSentByMe,
    );
  }
}