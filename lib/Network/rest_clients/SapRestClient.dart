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
}
