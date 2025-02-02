import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../utils/Constants.dart';

part 'EtecRestClient.g.dart';

@RestApi(baseUrl: Constants.BASE_URL_ETEC)
abstract class EtecRestClient {
  factory EtecRestClient(Dio dio, {String? baseUrl}) = _EtecRestClient;


  @POST('/TokenAuth')
  Future<Map<String, dynamic>> refreshToken(
      @Body() Map<String, dynamic> body);
}



