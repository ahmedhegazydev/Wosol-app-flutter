import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const String keyFirstLaunch = 'firstLaunch';
  static const String keyAppUpdateNeeded = 'appNeedUpdate';
  static const String keyIsLoggedIn = 'auth';
  static const String keySAPtoken = 'SAPtoken';
  static const String keyTokenExpiration = 'TokenExpiration';
  static const String keyAppLaunched = 'appLaunched';
  static const String keyTestPassword = 'testPassword';
  static const String keyTestEnvironment = 'testEnvironment';
  static const String keyUserNameDevOrPrd = 'userNameDevOrPrd';

  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  // Setters
  static Future<void> setFirstLaunch(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(keyFirstLaunch, value);
  }

  static Future<void> setAppUpdateNeeded(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(keyAppUpdateNeeded, value);
  }

  static Future<void> setIsLoggedIn(String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(keyIsLoggedIn, value);
  }

  static Future<void> setSAPtoken(String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(keySAPtoken, value);
  }

  static Future<void> setTokenExpiration(String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(keyTokenExpiration, value);
  }

  static Future<void> setAppLaunched(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(keyAppLaunched, value);
  }

  // Getters
  static Future<bool> getFirstLaunch() async {
    final prefs = await _getPrefs();
    return prefs.getBool(keyFirstLaunch) ?? false;
  }

  static Future<bool> getAppUpdateNeeded() async {
    final prefs = await _getPrefs();
    return prefs.getBool(keyAppUpdateNeeded) ?? false;
  }

  static Future<String> getIsLoggedIn() async {
    final prefs = await _getPrefs();
    return prefs.getString(keyIsLoggedIn) ?? '';
  }

  static Future<bool?> getAppLaunched() async {
    final prefs = await _getPrefs();
    return prefs.getBool(keyAppLaunched);
  }

  static Future<String?> getTestPassword() async {
    final prefs = await _getPrefs();
    return prefs.getString(keyTestPassword);
  }

  static Future<String?> getTestEnvironment() async {
    final prefs = await _getPrefs();
    return prefs.getString(keyTestEnvironment);
  }

  static Future<String?> getUserNameDevOrPrd() async {
    final prefs = await _getPrefs();
    return prefs.getString(keyUserNameDevOrPrd);
  }

  static Future<String?> getSapToken() async {
    final prefs = await _getPrefs();
    return prefs.getString(PrefManager.keySAPtoken);
  }

  static Future<int?> getTokenExpiration() async {
    final prefs = await _getPrefs();
    return prefs.getInt(PrefManager.keyTokenExpiration);
  }

}
