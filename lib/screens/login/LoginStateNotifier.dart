import 'package:flutter/cupertino.dart';
import 'package:flutter_apps/utils/ToastService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

import '../../NetworkManager.dart';
import 'LoginState.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  final NetworkManager networkManager = NetworkManager.instance;

  LoginStateNotifier() : super(LoginState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true);

    try {
      // Fetch text resources
      final fetchedTextResources = await networkManager.fetchTextResources(
        {
          "lang": 'ar',
          "SiteName": 'internalportal',
          "count": 100,
          "IsAsc": false,
          "filterName": 'ScreenName',
          "filterValue": 'Login',
        },
      );

      state = state.copyWith(
        textResources: fetchedTextResources,
        isLoading: false,
      );
    } catch (error) {
      print("Error fetching data: $error");
      state = state.copyWith(isLoading: false);
    }
  }

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> handleLogin(BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final username = state.userName ?? "";
    final password = state.password ?? "";

    if (username.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Username and password cannot be empty",
      );
      return;
    }

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    final isSuccess =
        username == "user" && password == "password"; // Mock validation

    if (isSuccess) {
      // Fluttertoast.showToast(msg: "Login successful");
      state = state.copyWith(isLoading: false);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Invalid username or password",
      );
    }
  }

  Future<void> checkBiometricsAvailability() async {
    try {
      final canCheckBiometrics = await auth.canCheckBiometrics;
      final isDeviceSupported = await auth.isDeviceSupported();
      if (canCheckBiometrics && isDeviceSupported) {
        state = state.copyWith(showBiometricsButton: true);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: "Error checking biometrics: $e");
    }
  }

  Future<void> handleBiometricLogin(BuildContext context) async {
    try {
      final didAuthenticate = await auth.authenticate(
        localizedReason: "Authenticate to login",
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (didAuthenticate) {
        ToastService.showSuccessToast(
          context,
          'Hello!',
          'This is a toast notification using Toastification.',
        );
        // Fluttertoast.showToast(msg: "Biometric authentication successful");
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        state = state.copyWith(
          errorMessage: "Biometric authentication failed",
        );
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Error during biometric authentication: $e",
      );
    }
  }

  void updateCurrentIndex(int index) {
    state = state.copyWith(currentLoginTypeSelection: index);
  }

  void updateUsername(String useName) {
    state = state.copyWith(userName: useName);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void setIsQuickAccessSelected(bool isQuickAccessSelected) {
    state = state.copyWith(isQuickAccessSelected: isQuickAccessSelected);
  }
}
