import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  // Create a secure storage instance
  static FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Public setter for secure storage instance (used for testing)
  static void setSecureStorage(FlutterSecureStorage instance) {
    _secureStorage = instance;
  }

  // Setters
  static Future<void> setFirstLaunch(bool value) async {
    await _secureStorage.write(key: keyFirstLaunch, value: value.toString());
  }

  static Future<void> setAppUpdateNeeded(bool value) async {
    await _secureStorage.write(key: keyAppUpdateNeeded, value: value.toString());
  }

  static Future<void> setIsLoggedIn(String value) async {
    await _secureStorage.write(key: keyIsLoggedIn, value: value);
  }

  static Future<void> setSAPtoken(String value) async {
    await _secureStorage.write(key: keySAPtoken, value: value);
  }

  static Future<void> setTokenExpiration(String value) async {
    await _secureStorage.write(key: keyTokenExpiration, value: value);
  }

  static Future<void> setAppLaunched(bool value) async {
    await _secureStorage.write(key: keyAppLaunched, value: value.toString());
  }

  static Future<void> setTestPassword(String value) async {
    await _secureStorage.write(key: keyTestPassword, value: value);
  }

  static Future<void> setTestEnvironment(String value) async {
    await _secureStorage.write(key: keyTestEnvironment, value: value);
  }

  static Future<void> setUserNameDevOrPrd(String value) async {
    await _secureStorage.write(key: keyUserNameDevOrPrd, value: value);
  }

  // Getters
  static Future<bool> getFirstLaunch() async {
    final value = await _secureStorage.read(key: keyFirstLaunch);
    return value?.toLowerCase() == 'true';
  }

  static Future<bool> getAppUpdateNeeded() async {
    final value = await _secureStorage.read(key: keyAppUpdateNeeded);
    return value?.toLowerCase() == 'true';
  }

  static Future<String?> getIsLoggedIn() async {
    return await _secureStorage.read(key: keyIsLoggedIn);
  }

  static Future<bool?> getAppLaunched() async {
    final value = await _secureStorage.read(key: keyAppLaunched);
    return value?.toLowerCase() == 'true';
  }

  static Future<String?> getTestPassword() async {
    return await _secureStorage.read(key: keyTestPassword);
  }

  static Future<String?> getTestEnvironment() async {
    return await _secureStorage.read(key: keyTestEnvironment);
  }

  static Future<String?> getUserNameDevOrPrd() async {
    return await _secureStorage.read(key: keyUserNameDevOrPrd);
  }

  static Future<String?> getSapToken() async {
    return await _secureStorage.read(key: keySAPtoken);
  }

  static Future<int?> getTokenExpiration() async {
    final value = await _secureStorage.read(key: keyTokenExpiration);
    return value != null ? int.tryParse(value) : null;
  }

  // Clear All Stored Data
  static Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
