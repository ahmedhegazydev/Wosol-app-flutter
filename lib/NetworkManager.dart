import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:flutter_apps/utils/PrefManager.dart';

import 'Network/SapRestClient.dart';

class NetworkManager {
  late Dio _wosolApi;
  late Dio _sapApi;

  // late SapRestClient sapRestClient;
  // late EtecRestClient etecRestClient;

  static final NetworkManager _instance = NetworkManager._internal();

  static NetworkManager get instance => _instance;

  NetworkManager._internal() {
    _wosolApi = _createDioInstance(Constants.BASE_URL_ETEC);
    _sapApi = _createDioInstance(Constants.BASE_URL_SAP);

    // sapRestClient = SapRestClient(_sapApi);
    // etecRestClient = EtecRestClient(_wosolApi);
  }

  Dio _createDioInstance(String baseUrl) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    dio.interceptors.add(LogInterceptor(responseBody: true)); // Logging
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 4),
      ],
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print('Request: ${options.method} ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode}');
        handler.next(response);
      },
      onError: (DioException error, handler) {
        print('Error: ${error.response?.statusCode}');
        if (_shouldRetry(error)) {
          handler.resolve(_retryRequest(error.requestOptions) as Response);
        } else {
          handler.next(error);
        }
      },
    ));

    return dio;
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.unknown ||
        error.response?.statusCode == 401;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _sapApi.request(requestOptions.path,
        options: options,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters);
  }

  Future<void> _refreshToken() async {
    final testPassword = await PrefManager.getTestPassword() ?? "\$@p_P@ssw0rd";
    final testEnvironment = await PrefManager.getTestEnvironment() ?? 'PRD';
    final userName = await PrefManager.getUserNameDevOrPrd() ?? '';

    try {
      final response = await _wosolApi.post(
        'TokenAuth',
        data: {
          'username': 'ETEC@SAPAPI',
          'password': testPassword,
          'environment': testEnvironment,
          'SapUser': userName.replaceAll('@dev', ''),
        },
      );

      final token = response.data['accessToken'];
      final expiration = response.data['expireInSeconds'];
      await PrefManager.setSAPtoken(token);
      await PrefManager.setTokenExpiration(expiration);
    } catch (e) {
      print('Token refresh failed: $e');
      rethrow;
    }
  }

  Future<bool> _isTokenExpired() async {
    final expirationTime = await PrefManager.getTokenExpiration();
    if (expirationTime == null) return true;

    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return expirationTime <= currentTime;
  }

  Future<Dio> _getSapApi() async {
    String? token = await PrefManager.getSapToken();

    if (await _isTokenExpired()) {
      await _refreshToken();
      token = await PrefManager.getSapToken();
    }

    _sapApi.options.headers['Authorization'] = 'Bearer $token';
    return _sapApi;
  }

  // Get filtered list items
  Future<dynamic> getListsItemsFiltered(Map<String, dynamic> params) async {
    try {
      final response = await _wosolApi.get(Constants.GET_LISTS_ITEMS_FILTERED,
          queryParameters: params);
      return response.data;
    } catch (error) {
      print("Error in getListsItemsFiltered: $error");
      rethrow;
    }
  }

  // Get list items
  Future<dynamic> getListsItems(Map<String, dynamic> params) async {
    try {
      final response = await _wosolApi.get(Constants.GET_LISTS_ITEMS,
          queryParameters: params);
      return response.data;
    } catch (error) {
      print("Error in getListsItems: $error");
      rethrow;
    }
  }

  // Get item by ID
  Future<dynamic> getItemById(Map<String, dynamic> params) async {
    try {
      final response = await _wosolApi.get(Constants.GET_ITEM_BY_ID,
          queryParameters: params);
      return response.data;
    } catch (error) {
      print("Error in getItemById: $error");
      rethrow;
    }
  }

  // SAP API request
  Future<dynamic> sapApiRequest(String endPoint,
      {required Map<String, dynamic> params}) async {
    try {
      final dio = await _getSapApi();
      final response = await dio.get(endPoint, queryParameters: params);
      return response.data;
    } catch (error) {
      print("Error in sapApiRequest: $error");
      rethrow;
    }
  }

  // Authentication login via POST
  Future<dynamic> postAuthLogin(Map<String, dynamic> params) async {
    try {
      final response =
          await _wosolApi.post(Constants.LOGIN_AUTH_BIOMETRICS, data: params);
      return response.data;
    } catch (error) {
      print("Error in postAuthLogin: $error");
      rethrow;
    }
  }

  // Fetch Employee Data
  Future<dynamic> fetchEmployeeData(Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_SUMMARY, params: params);
  }

  // Fetch Employee Attendance Records
  Future<dynamic> fetchEmployeeAttendanceRecords(
      Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_ATTENDANCE_RECORDS, params: params);
  }

  // Fetch Employee Leave Records
  Future<dynamic> fetchEmployeeLeavesRecord(Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_LEAVE_HISTORY, params: params);
  }

  // Fetch Employee Excuse Hours Record
  Future<dynamic> fetchEmployeeExcuseHoursRecord(
      Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_EXCUSE_HISTORY, params: params);
  }

  // Fetch Employee Employment Data
  Future<dynamic> fetchEmployeeEmploymentData(
      Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_EMPLOYMENT, params: params);
  }

  // Fetch Employee Dependants Data
  Future<dynamic> fetchEmployeeDependantsData(
      Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_DEPENDANTS, params: params);
  }

  // Fetch Employee Financial Data
  Future<dynamic> fetchEmployeeFinancialData(
      Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_FINANCIAL_INFORMATION,
        params: params);
  }

  // Fetch Salary Details
  Future<dynamic> fetchSalaryDetails(Map<String, dynamic> params) async {
    return sapApiRequest(Constants.EMPLOYEE_COMPENSATIONS, params: params);
  }

  // Fetch SAP Token
  Future<dynamic> fetchSapToken(Map<String, dynamic> params) async {
    try {
      final response =
          await _sapApi.post(Constants.END_POINT_TOKEN, data: params);
      return response.data;
    } catch (error) {
      print("Error in fetchSapToken: $error");
      rethrow;
    }
  }

  // Fetch Text Resources
  Future<Map<String, dynamic>> fetchTextResources(
    Map<String, dynamic> params,
  ) async {
    try {
      final defaultParams = {'listName': 'textResources'};
      final combinedParams = {...defaultParams, ...params};
      final response = await getListsItemsFiltered(combinedParams);

      return {
        'data': response,
        'isLoading': false,
        'error': null,
        // 'screen': screen,
      };
    } catch (error) {
      print("Error in fetchTextResources: $error");
      return {
        'data': null,
        'isLoading': false,
        'error': error.toString(),
        // 'screen': screen,
      };
    }
  }

  // Fetch Intro Data
  Future<Map<int, dynamic>> fetchIntroData(List<int> ids) async {
    Map<int, dynamic> introData = {};
    try {
      for (int id in ids) {
        final response = await getItemById({
          'listName': 'Intro',
          'id': id,
          'lang': 'ar',
          'SiteName': 'internalportal',
        });
        introData[id] = {'data': response, 'isLoading': false, 'error': null};
      }
    } catch (error) {
      for (int id in ids) {
        introData[id] = {
          'data': null,
          'isLoading': false,
          'error': error.toString()
        };
      }
      print("Error in fetchIntroData: $error");
    }
    return introData;
  }
}
