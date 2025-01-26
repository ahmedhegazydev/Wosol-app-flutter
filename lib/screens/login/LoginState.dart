import 'package:flutter/cupertino.dart';
import 'package:flutter_apps/utils/PrefManager.dart';
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
  final String storedUserName;
  final Map<int, Widget> tabsLoginTypes;
  final int currentLoginTypeSelection;

  LoginState({
    this.isLoading = false,
    this.textResources,
    this.showBiometricsButton = false,
    this.isQuickAccessSelected = false,
    this.currentLoginTypeSelection = 0,
    this.storedUserName = "",
    this.errorMessage,
    this.userName,
    this.password,
    this.tabsLoginTypes = const {
      0: Text('الدخول السريع'),
      1: Text('تسجيل الدخول'),
    },
  });

  // Add the copyWith method
  LoginState copyWith({
    bool? isLoading,
    Map<String, dynamic>? textResources,
    bool? showBiometricsButton,
    bool? isQuickAccessSelected,
    int? currentLoginTypeSelection,
    String? errorMessage,
    String? userName,
    String? password,
    String? storedUserName,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      textResources: textResources ?? this.textResources,
      showBiometricsButton: showBiometricsButton ?? this.showBiometricsButton,
      isQuickAccessSelected: isQuickAccessSelected ?? this.isQuickAccessSelected,
      errorMessage: errorMessage ?? this.errorMessage,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      currentLoginTypeSelection:
      currentLoginTypeSelection ?? this.currentLoginTypeSelection,
      storedUserName: storedUserName ?? this.storedUserName,
      tabsLoginTypes: this.tabsLoginTypes,
    );
  }

  // Initialize storedUserName asynchronously
  // static Future<LoginState> initialize() async {
  //   final storedUserName = await PrefManager.getUserNameDevOrPrd() ?? "";
  //   return LoginState(storedUserName: storedUserName);
  // }
}

final loginStateProvider =
StateNotifierProvider<LoginStateNotifier, LoginState>(
      (ref) => LoginStateNotifier(),
);
