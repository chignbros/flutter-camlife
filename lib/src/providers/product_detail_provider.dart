import 'package:flutter/material.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/services/home_service.dart';

class ProductDetailProvider extends ChangeNotifier {
  ApiServices apiServices;
  ProductDetailProvider({@required this.apiServices});

  ProductDetailModel _productDetail;
  ProductDetailModel get productDetail => _productDetail;

  Future getProductDetail(int productId) async {
    _productDetail = await apiServices.fetchProductDetail(productId: productId);
    notifyListeners();
  }
}
