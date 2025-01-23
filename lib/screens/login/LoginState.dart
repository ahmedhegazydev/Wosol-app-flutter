import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'LoginStateNotifier.dart';

class LoginState {
  final bool isLoading;
  final bool showBiometricsButton;
  final String? errorMessage;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  LoginState({
    this.isLoading = false,
    this.showBiometricsButton = false,
    this.errorMessage,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
  })  : usernameController = usernameController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController();


  // Add the copyWith method
  LoginState copyWith({
    bool? isLoading,
    bool? showBiometricsButton,
    String? errorMessage,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      showBiometricsButton: showBiometricsButton ?? this.showBiometricsButton,
      errorMessage: errorMessage ?? this.errorMessage,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
    );
  }

}

final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
      (ref) => LoginStateNotifier(),
);
