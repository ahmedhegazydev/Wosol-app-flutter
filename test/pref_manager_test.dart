import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_apps/utils/PrefManager.dart';

// Mock class for FlutterSecureStorage
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    PrefManager.setSecureStorage(mockStorage); // Inject mock storage

    // Mock the write, read, and deleteAll methods to return Futures
    when(() => mockStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenAnswer((_) async {});

    when(() => mockStorage.read(key: any(named: 'key')))
        .thenAnswer((_) async => null);

    when(() => mockStorage.deleteAll()).thenAnswer((_) async {});
  });

  group('PrefManager tests', () {
    test('setFirstLaunch stores true value', () async {
      // Act
      await PrefManager.setFirstLaunch(true);

      // Assert
      verify(() =>
              mockStorage.write(key: PrefManager.keyFirstLaunch, value: 'true'))
          .called(1);
    });

    test('getFirstLaunch returns true', () async {
      // Arrange
      when(() => mockStorage.read(key: PrefManager.keyFirstLaunch))
          .thenAnswer((_) async => 'true');

      // Act
      final result = await PrefManager.getFirstLaunch();

      // Assert
      expect(result, true);
      verify(() => mockStorage.read(key: PrefManager.keyFirstLaunch)).called(1);
    });

    test('setIsLoggedIn stores a value', () async {
      // Act
      await PrefManager.setIsLoggedIn('loggedInValue');

      // Assert
      verify(() => mockStorage.write(
          key: PrefManager.keyIsLoggedIn, value: 'loggedInValue')).called(1);
    });

    test('getIsLoggedIn retrieves the correct value', () async {
      // Arrange
      when(() => mockStorage.read(key: PrefManager.keyIsLoggedIn))
          .thenAnswer((_) async => 'loggedInValue');

      // Act
      final result = await PrefManager.getIsLoggedIn();

      // Assert
      expect(result, 'loggedInValue');
      verify(() => mockStorage.read(key: PrefManager.keyIsLoggedIn)).called(1);
    });

    test('setAppUpdateNeeded stores false value', () async {
      // Act
      await PrefManager.setAppUpdateNeeded(false);

      // Assert
      verify(() => mockStorage.write(
          key: PrefManager.keyAppUpdateNeeded, value: 'false')).called(1);
    });

    test('getAppUpdateNeeded returns false', () async {
      // Arrange
      when(() => mockStorage.read(key: PrefManager.keyAppUpdateNeeded))
          .thenAnswer((_) async => 'false');

      // Act
      final result = await PrefManager.getAppUpdateNeeded();

      // Assert
      expect(result, false);
      verify(() => mockStorage.read(key: PrefManager.keyAppUpdateNeeded))
          .called(1);
    });

    test('clearAll deletes all stored data', () async {
      // Act
      await PrefManager.clearAll();

      // Assert
      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}
