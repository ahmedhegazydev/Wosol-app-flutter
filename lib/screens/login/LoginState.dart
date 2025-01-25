import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'LoginStateNotifier.dart';

class LoginState {
  final Map<String, dynamic>? textResources;
  // final Map<String, dynamic>? textResourcesPermission;
  final bool isLoading;
  final bool showBiometricsButton;
  final String? errorMessage;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

   Map<int, Widget> tabsLoginTypes = {
    0: Text('الدخول السريع'),
    1: Text('تسجيل الدخول'),
  };
  final int? currentLoginTypeSelection;

  LoginState({
    this.isLoading = false,
    this.textResources,
    // this.textResourcesPermission,
    this.showBiometricsButton = false,
    this.currentLoginTypeSelection = 0,
    this.errorMessage,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
  })  : usernameController = usernameController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController();


  // Add the copyWith method
  LoginState copyWith({
    bool? isLoading,
    Map<String, dynamic>? textResources,
    // Map<String, dynamic>? textResourcesPermission,
    bool? showBiometricsButton,
    int? currentLoginTypeSelection,
    String? errorMessage,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      textResources: textResources ?? this.textResources,
      // textResourcesPermission: textResourcesPermission ?? this.textResourcesPermission,

      showBiometricsButton: showBiometricsButton ?? this.showBiometricsButton,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLoginTypeSelection: currentLoginTypeSelection ?? this.currentLoginTypeSelection,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
    );
  }

}

final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
      (ref) => LoginStateNotifier(),
);
