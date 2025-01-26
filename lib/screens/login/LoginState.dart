import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'LoginStateNotifier.dart';

class LoginState {
  final Map<String, dynamic>? textResources;
  final bool isLoading;
  final bool showBiometricsButton;
  final bool isQuickAccessSelected;
  final String? errorMessage;
  final String? userName;
  final String? password;

   Map<int, Widget> tabsLoginTypes = {
    0: Text('الدخول السريع'),
    1: Text('تسجيل الدخول'),
  };
  final int? currentLoginTypeSelection;

  LoginState({
    this.isLoading = false,
    this.textResources,
    this.showBiometricsButton = false,
    this.isQuickAccessSelected = false,
    this.currentLoginTypeSelection = 0,
    this.errorMessage,
    this.userName,
    this.password,
  }) ;


  // Add the copyWith method
  LoginState copyWith({
    bool? isLoading,
    Map<String, dynamic>? textResources,
    bool? showBiometricsButton,
    bool? isQuickAccessSelected,
    int? currentLoginTypeSelection,
    String? errorMessage,
    String? userName,
     String? password
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      textResources: textResources ?? this.textResources,
      showBiometricsButton: showBiometricsButton ?? this.showBiometricsButton,
      isQuickAccessSelected: isQuickAccessSelected ?? this.isQuickAccessSelected,
      errorMessage: errorMessage ?? this.errorMessage,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      currentLoginTypeSelection: currentLoginTypeSelection ?? this.currentLoginTypeSelection,
    );
  }

}

final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
      (ref) => LoginStateNotifier(),
);
