import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Logs a custom event.
  /// [eventName] is the name of the event.
  /// [params] are additional parameters to log with the event.
  static Future<void> logEvent(String eventName, {Map<String, Object>? params}) async {
    try {
      await _analytics.logEvent(name: eventName, parameters: params);
      // print('Event logged: $eventName, $params');
    } catch (error) {
      // print('Failed to log event: $eventName, $error');
    }
  }

  /// Logs a screen view.
  /// [screenName] is the name of the screen.
  static Future<void> logScreenView(String screenName) async {
    try {
      await _analytics.setCurrentScreen(screenName: screenName, screenClassOverride: screenName);
      // print('Screen viewed: $screenName');
    } catch (error) {
      // print('Failed to log screen view: $screenName, $error');
    }
  }

  /// Logs button clicks.
  /// [buttonName] is the name of the button clicked.
  static Future<void> logButtonClick(String buttonName) async {
    await logEvent('button_click', params: {'button_name': buttonName});
  }

  /// Logs swipe refresh action.
  /// [buttonName] is the name associated with the swipe action.
  static Future<void> logSwipeRefreshed(String buttonName) async {
    await logEvent('swipe_pulled_refreshed', params: {'button_name': buttonName});
  }

  /// Logs dispatch events.
  /// [dispatchName] is the name of the dispatch call.
  static Future<void> logDispatchEvent(String dispatchName) async {
    await logEvent('dispatch_call', params: {'dispatch_name': dispatchName});
  }

  /// Logs button dismissal.
  /// [buttonName] is the name of the button dismissed.
  static Future<void> logButtonDismiss(String buttonName) async {
    await logEvent('button_dismiss', params: {'button_name': buttonName});
  }

  /// Logs screen dismissal.
  /// [screenName] is the name of the screen dismissed.
  static Future<void> logScreenDismiss(String screenName) async {
    await logEvent('screen_dismiss', params: {'screen_name': screenName});
  }
}
