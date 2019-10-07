import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/buy_product_provider.dart';
import 'package:sample_todo/src/providers/camlife_info_provider.dart';
import 'package:sample_todo/src/providers/categorise_provider.dart';
import 'package:sample_todo/src/providers/home_provider.dart';
import 'package:sample_todo/src/providers/product_detail_provider.dart';
import 'package:sample_todo/src/providers/products_provider.dart';
import 'package:sample_todo/src/services/preference_service.dart';
import 'services/home_service.dart';
import 'utils/http.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiProvider,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider<Dio>.value(value: dio),
  Provider<PreferenceService>.value(value: PreferenceService()),
];
List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Dio, ApiServices>(
    builder: (context, Dio http, ApiServices apiServices) {
      return ApiServices(https: http);
    },
  )
];
List<SingleChildCloneableWidget> uiProvider = [
  ChangeNotifierProxyProvider<ApiServices, HomeProvider>(
    builder: (ctx, apiService, homeApi) {
      return HomeProvider(apiServices: apiService);
    },
  ),
  ChangeNotifierProxyProvider<ApiServices, CategoriseProvider>(
    builder: (ctx, apiService, categoryApi) {
      return CategoriseProvider(apiServices: apiService);
    },
  ),
  ChangeNotifierProxyProvider<ApiServices, ProductsProvider>(
    builder: (ctx, apiService, productApi) {
      return ProductsProvider(apiServices: apiService);
    },
  ),
  ChangeNotifierProxyProvider<ApiServices, CamlifeProvider>(
    builder: (ctx, apiService, infoApi) {
      return CamlifeProvider(apiServices: apiService);
    },
  ),
  ChangeNotifierProxyProvider<ApiServices, ProductDetailProvider>(
    builder: (ctx, apiService, proDetaiApi) {
      return ProductDetailProvider(apiServices: apiService);
    },
  ),
  ChangeNotifierProvider<BuyProductProvider>(
    builder: (ctx) {
      return BuyProductProvider();
    },
  ),
];
