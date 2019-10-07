import 'package:flutter/widgets.dart';
import 'package:sample_todo/src/models/categories_model.dart';
import 'package:sample_todo/src/services/home_service.dart';

import '../models/promotion_model.dart';

class CategoriseProvider extends ChangeNotifier {
  ApiServices apiServices;

  CategoriseProvider({@required this.apiServices}) {
    getCategorise();
    getAllActivePromotions();
    getActivePromotions(categoryId);
  }

  int _categoryId;

  int get categoryId => _categoryId;

  List<TopPromotions> _topPromotions = [];

  List<TopPromotions> get topPromotions => _topPromotions;

  List<CategoriesModel> _categorise;

  List<CategoriesModel> get categorise => _categorise;

  Future getCategorise() async {
    _categorise = await apiServices.fetchCategory();
    notifyListeners();
  }

  Future<void> reset() async {
    _topPromotions = [];
    await Future.value([]);
    notifyListeners();
  }

  Future<void> getActivePromotions(int categoryId) async {
    try {
      final topPromotions =
          await apiServices.fetchPromotionById(categoryId: categoryId);
      notifyListeners();

      _topPromotions.addAll(topPromotions);

      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }

  Future<void> getAllActivePromotions() async {
    try {
      final topPromotions = await apiServices.fetchPromotion();
      notifyListeners();

      _topPromotions.addAll(topPromotions);

      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
