import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/Constants.dart';

part 'SapRestClient.g.dart';

@RestApi(baseUrl: Constants.BASE_URL_SAP)
abstract class SapRestClient {
  factory SapRestClient(
      Dio dio, {
        String? baseUrl,
        ParseErrorLogger? errorLogger,
      }) = _SapRestClient;

  @POST(Constants.END_POINT_TOKEN)
  Future<Map<String, dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @GET(Constants.EMPLOYEE_SUMMARY)
  Future<Map<String, dynamic>> fetchEmployeeData(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_ATTENDANCE_RECORDS)
  Future<Map<String, dynamic>> fetchEmployeeAttendanceRecords(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_LEAVE_HISTORY)
  Future<Map<String, dynamic>> fetchEmployeeLeavesRecord(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_EXCUSE_HISTORY)
  Future<Map<String, dynamic>> fetchEmployeeExcuseHoursRecord(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_EMPLOYMENT)
  Future<Map<String, dynamic>> fetchEmployeeEmploymentData(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_DEPENDANTS)
  Future<Map<String, dynamic>> fetchEmployeeDependantsData(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_FINANCIAL_INFORMATION)
  Future<Map<String, dynamic>> fetchEmployeeFinancialData(@Queries() Map<String, dynamic> params);

  @GET(Constants.EMPLOYEE_COMPENSATIONS)
  Future<Map<String, dynamic>> fetchSalaryDetails(@Queries() Map<String, dynamic> params);

  @POST(Constants.END_POINT_TOKEN)
  Future<Map<String, dynamic>> fetchSapToken(@Body() Map<String, dynamic> params);
}