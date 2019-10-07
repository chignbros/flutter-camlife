import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/models/camlife_info_model.dart';
import 'package:sample_todo/src/models/categories_model.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/models/products_model.dart';
import 'package:sample_todo/src/models/promotion_model.dart';
import 'package:sample_todo/src/utils/base_url.dart';

class ApiServices {
  Dio https;

  ApiServices({@required this.https});

  Future<List<TopPromotions>> fetchPromotion() async {
    final response = await https.get(BaseUrl.topActivePromotionUri);

    var rest = response.data['data'] as List;
    return rest
        .map<TopPromotions>((json) => TopPromotions.fromJson(json))
        .toList();
  }

  Future<List<CategoriesModel>> fetchCategory() async {
    final response = await https.get(BaseUrl.categoryUri);
    List<CategoriesModel> categorise = [];

    for (var category in response.data['data']) {
      categorise.add(CategoriesModel.fromJson(category));
    }

    return categorise;
  }

  Future<List<Products>> fetchProducts() async {
    final response = await https.get(BaseUrl.productsUri);
    List<Products> products = [];

    for (var product in response.data['data']) {
      products.add(Products.fromJson(product));
    }

    return products;
  }

  Future<List<TopPromotions>> fetchPromotionById(
      {@required int categoryId}) async {
    final response =
        await https.get('${BaseUrl.activePromotionByid}$categoryId');

    var rest = response.data['data'] as List;
    return rest
        .map<TopPromotions>((json) => TopPromotions.fromJson(json))
        .toList();
  }

  Future<CamlifeInfoModel> fetchInfo() async {
    final response = await https.get(BaseUrl.infoUri);
    var infos = CamlifeInfoModel.fromJson(response.data['data'][0]);
    return infos;
  }

  Future<ProductDetailModel> fetchProductDetail(
      {@required int productId}) async {
    final responese = await https.get('${BaseUrl.productDetailUri}/$productId');
    var productDetail = ProductDetailModel.fromJson(responese.data['data']);
    return productDetail;
  }
}
