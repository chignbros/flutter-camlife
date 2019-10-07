import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/utils/base_url.dart';

BaseOptions options = new BaseOptions(
  baseUrl:
      kReleaseMode ? BaseUrl.baseUrlProduction : BaseUrl.baseUrlDevelopment,
  connectTimeout: 10000,
  receiveTimeout: 3000,
  headers: {"X-ODP-API-KEY": BaseUrl.xApiKey},
);

Dio dio = Dio(options);
