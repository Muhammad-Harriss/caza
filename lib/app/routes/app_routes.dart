abstract class AppRoutes {
  // Onboarding
  static const String onboarding             = '/';

  // Auth
  static const String login                  = '/login';
  static const String signup                 = '/signup';
  static const String forgotPassword         = '/forgot-password';
  static const String inputPassword          = '/input-new-password';
  static const String passwordChangedSuccess = '/password-changed-success';
  static const String twoFaEmail             = '/2fa-email';
  static const String twoFaPhone             = '/2fa-phone';
  static const String biometric              = '/biometric';
  static const String fillProfile            = '/fill-profile';
  static const String accountReady           = '/account-ready';

  // Main
  static const String home                   = '/home';

  // Messages
  static const String messages               = '/messages';
  
  static const String newConversation        = '/new-conversation';
  static const String messagesSearch         = '/messages/search';
  static const String starredMessages        = '/starred-messages';
  static const String media                  = '/media';

  // Groups
  static const String groups                 = '/groups';
  static const String newGroup               = '/new-group';
  static const String addMembers             = '/add-members';
  static const String groupChat              = '/group-chat';
  static const String groupInfo              = '/group-info';

  // Files
  static const String filesBoxView           = '/files/box-view';
  static const String filesListView          = '/files/list-view';
  static const String fileDetail             = '/file-detail';
  static const String fileUpload             = '/file-upload';
  static const String recycleBin             = '/recycle-bin';
  static const String addNewFolder           = '/add-new-folder';

  // AI
  static const String chatSummary            = '/ai/chat-summary';
  static const String suggestReply           = '/ai/suggest-reply';
  static const String askAiBot               = '/ai/ask-bot';

  // Profile
  static const String profile                = '/profile';
  static const String editProfile            = '/profile/edit';
  static const String accountInfo            = '/profile/account-info';
  static const String employmentInfo         = '/profile/employment-info';
  static const String personalInfo           = '/profile/personal-info';
  static const String security               = '/profile/security';
  static const String notifications          = '/profile/notifications';
  static const String theme                  = '/profile/theme';
  static const String language               = '/profile/language';

  //Personal Messages
  static const personalMessage = '/personal-message';
  static const newMessage = '/new-message';
  static const chat = '/chat'; 


}