import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../app/routes/app_routes.dart';

enum BiometricState { idle, authenticating, error, notRecognized, verified }

class BiometricController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();

  final Rx<BiometricState> state = BiometricState.idle.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 500), () {
      authenticate();
    });
  }

  Future<void> authenticate() async {
    try {
      state.value = BiometricState.authenticating;
      errorMessage.value = '';

      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isSupported = await _auth.isDeviceSupported();

      if (!canCheck || !isSupported) {
        state.value = BiometricState.notRecognized;
        return;
      }

      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Use your fingerprint to verify your identity',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
        ),
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );

      if (didAuthenticate) {
        state.value = BiometricState.verified;
        await Future.delayed(const Duration(milliseconds: 1500));
        Get.offAllNamed(AppRoutes.home);
      } else {
        state.value = BiometricState.notRecognized;
      }
    } catch (e) {
      state.value = BiometricState.notRecognized;
    }
  }

  // Cancel → first time login (fill profile)
  void cancel() => Get.offAllNamed(AppRoutes.fillProfile);
}