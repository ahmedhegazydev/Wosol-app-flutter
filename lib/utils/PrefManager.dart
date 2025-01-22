import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const String keyFirstLaunch = 'firstLaunch';
  static const String keyAppUpdateNeeded = 'appNeedUpdate';
  static const String keyIsLoggedIn = 'auth';
  static const String keyAppLaunched = 'appLaunched';

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
}
