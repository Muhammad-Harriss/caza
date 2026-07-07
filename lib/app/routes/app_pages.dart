import 'package:get/get.dart';

import 'package:caza/features/auth/forgot_password/bindings/forget_password_binding.dart';
import 'package:caza/features/auth/forgot_password/view/forget_password_screen.dart';
import 'package:caza/features/auth/login/view/login_screen.dart';
import 'package:caza/features/auth/two_fa/bindings/two_fa_binding.dart';
import 'package:caza/features/auth/two_fa/view/two_fa_screen.dart';
import 'package:caza/features/onbording/bindings/onbording_binding.dart';
import 'package:caza/features/onbording/view/onbording_screen.dart';
import 'package:caza/features/auth/biometric/view/biometric_screen.dart';
import 'package:caza/features/auth/fill_Profile/view/fill_profile_screen.dart';
import 'package:caza/features/auth/fill_Profile/bindings/fill_profile_binding.dart';
import 'package:caza/features/auth/account_ready/view/account_ready_screen.dart';
import 'package:caza/features/auth/input_new_password/view/input_new_password_screen.dart';
import 'package:caza/features/auth/password_changed_success/view/password_changed_success_screen.dart';

import '../../features/auth/login/bindings/login_binding.dart';
import '../../features/auth/signup/bindings/signup_binding.dart';
import '../../features/auth/signup/views/signup_screen.dart';
import '../../features/auth/input_new_password/bindings/input_new_password_binding.dart';
import '../../features/auth/password_changed_success/bindings/password_changed_success_binding.dart';
import '../../features/auth/biometric/bindings/biometric_binding.dart';
import '../../features/auth/account_ready/bindings/account_ready_binding.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.onboarding;

  static final routes = [

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.twoFaEmail,
      page: () => const TwoFaScreen(),
      binding: TwoFaBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.inputPassword,
      page: () => const InputNewPasswordScreen(),
      binding: InputNewPasswordBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.passwordChangedSuccess,
      page: () => const PasswordChangedSuccessScreen(),
      binding: PasswordChangedSuccessBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.biometric,
      page: () => const BiometricScreen(),
      binding: BiometricBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.fillProfile,
      page: () => const FillProfileScreen(),
      binding: FillProfileBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.accountReady,
      page: () => const AccountReadyScreen(),
      binding: AccountReadyBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}