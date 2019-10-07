import 'package:flutter/cupertino.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/models/products_model.dart';
import 'package:sample_todo/src/services/home_service.dart';

class ProductsProvider extends ChangeNotifier {
  ApiServices apiServices;

  ProductsProvider({@required this.apiServices}) {
    getProducts();
  }

  Object _error;

  bool get error => _error;

  List<Products> _products = [];

  List<Products> get products => _products;

  Future<void> reset() async {
    _products = [];
    await Future.value([]);
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      final products = await apiServices.fetchProducts();
      notifyListeners();
      _products.addAll(products);

      notifyListeners();
    } catch (e) {
      _error = e;
      print(e);
      notifyListeners();
    }
  }

  ProductDetailModel _productDetail;
  ProductDetailModel get productDetail => _productDetail;

  Future getProductDetail(int productId) async {
    _productDetail = await apiServices.fetchProductDetail(productId: productId);
    notifyListeners();
  }
}
