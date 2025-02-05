import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/Constants.dart';

part 'EtecRestClient.g.dart';

@RestApi(baseUrl: Constants.BASE_URL_ETEC)
abstract class EtecRestClient {
  factory EtecRestClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _EtecRestClient;

  @GET(Constants.GET_LISTS_ITEMS_FILTERED)
  Future<Map<String, dynamic>> getListsItemsFiltered(
      @Queries() Map<String, dynamic> params);

  @GET(Constants.GET_LISTS_ITEMS)
  Future<Map<String, dynamic>> getListsItems(
      @Queries() Map<String, dynamic> params);

  @GET(Constants.GET_ITEM_BY_ID)
  Future<Map<String, dynamic>> getItemById(
      @Queries() Map<String, dynamic> params);
}
