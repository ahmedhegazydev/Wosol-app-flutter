import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/Constants.dart';
import '../data/tutorial/IntroItem.dart';
import '../data/tutorial/ItemTutorial.dart';

part 'EtecRestClient.g.dart';

@RestApi(baseUrl: Constants.BASE_URL_ETEC)
abstract class EtecRestClient {
  factory EtecRestClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _EtecRestClient;

  @GET(Constants.GET_LISTS_ITEMS_FILTERED)
  // Future<Map<String, dynamic>> getListsItemsFiltered(
  Future<List<ItemTutorial>> getListsItemsFiltered(
      @Queries() Map<String, dynamic> params);

  @GET(Constants.GET_LISTS_ITEMS)
  Future<Map<String, dynamic>> getListsItems(
      @Queries() Map<String, dynamic> params);

  // @GET(Constants.GET_ITEM_BY_ID)
  // // Future<Map<String, dynamic>> getItemById(
  // Future<IntroItem> getItemById(
  //     @Queries() Map<String, dynamic> params);

  @GET(Constants.GET_ITEM_BY_ID)
  Future<T> getItemById<T>(
      @Queries() Map<String, dynamic> params);


  @POST(Constants.LOGIN_AUTH_BIOMETRICS)
  Future<Map<String, dynamic>> postAuthLogin(@Body() Map<String, dynamic> body);


}
