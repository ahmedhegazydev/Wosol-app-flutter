import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../utils/Constants.dart';

part 'SapRestClient.g.dart';

@RestApi(baseUrl: Constants.BASE_URL_SAP)
abstract class SapRestClient {

  factory SapRestClient(Dio dio, {String? baseUrl}) = _SapRestClient;


}



