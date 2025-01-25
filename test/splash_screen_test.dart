// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_apps/utils/Constants.dart';
// import 'package:flutter_apps/utils/PrefManager.dart';
// import 'package:flutter_apps/screens/SplashScreen.dart';
// import 'package:mockito/mockito.dart';
//
// // Mock PrefManager using mocktail (or mockito)
// class MockPrefManager extends Mock implements PrefManager {}
//
// void main() {
//   late MockPrefManager mockPrefManager;
//
//   setUp(() {
//     mockPrefManager = MockPrefManager();
//
//     // Mock static methods in PrefManager
//     when(() => PrefManager.getFirstLaunch()).thenAnswer((_) async => false);
//     when(() => PrefManager.getAppUpdateNeeded()).thenAnswer((_) async => false);
//     when(() => PrefManager.getIsLoggedIn()).thenAnswer((_) async => Constants.VALUE_IS_LOGGED_IN);
//     when(() => PrefManager.getAppLaunched()).thenAnswer((_) async => null);
//     when(() => PrefManager.setFirstLaunch(true)).thenAnswer((_) async {});
//     when(() => PrefManager.setAppLaunched(false)).thenAnswer((_) async {});
//   });
//
//   testWidgets('SplashScreen loads and navigates to TUTORIAL on first launch', (WidgetTester tester) async {
//     // Set up navigation observer to capture navigation calls
//     final mockObserver = MockNavigatorObserver();
//
//     await tester.pumpWidget(
//       MaterialApp(
//         home: SplashScreen(),
//         navigatorObservers: [mockObserver],
//         routes: {
//           Constants.TUTORIAL: (context) => const Scaffold(body: Text('Tutorial Screen')),
//         },
//       ),
//     );
//
//     // Wait for the animation to complete
//     await tester.pumpAndSettle();
//
//     // Verify navigation to the TUTORIAL route
//     verify(() => mockObserver.didPush(any(), any())).called(1);
//   });
//
//   testWidgets('SplashScreen navigates to HOME if logged in', (WidgetTester tester) async {
//     // Mock a logged-in state
//     when(() => PrefManager.getFirstLaunch()).thenAnswer((_) async => true);
//     when(() => PrefManager.getIsLoggedIn()).thenAnswer((_) async => Constants.VALUE_IS_LOGGED_IN);
//
//     final mockObserver = MockNavigatorObserver();
//
//     await tester.pumpWidget(
//       MaterialApp(
//         home: SplashScreen(),
//         navigatorObservers: [mockObserver],
//         routes: {
//           Constants.HOME: (context) => const Scaffold(body: Text('Home Screen')),
//         },
//       ),
//     );
//
//     // Wait for the animation to complete
//     await tester.pumpAndSettle();
//
//     // Verify navigation to the HOME route
//     verify(() => mockObserver.didPush(any(), any())).called(1);
//   });
//
//   testWidgets('SplashScreen renders correctly', (WidgetTester tester) async {
//     // Render the widget
//     await tester.pumpWidget(
//       MaterialApp(
//         home: const SplashScreen(),
//       ),
//     );
//
//     // Verify presence of Lottie animation
//     expect(find.byType(LottieBuilder), findsOneWidget);
//
//     // Verify presence of SVG logo
//     expect(find.byType(SvgPicture), findsOneWidget);
//   });
// }
//
// // MockNavigatorObserver implementation for navigation tracking
// class MockNavigatorObserver extends Mock implements NavigatorObserver {}
