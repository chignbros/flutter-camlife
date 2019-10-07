import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_todo/src/models/promotion_model.dart';
import 'package:sample_todo/src/services/home_service.dart';

class HomeProvider extends ChangeNotifier {
  ApiServices apiServices;

  HomeProvider({@required this.apiServices}) {
    gettopPromotionsImage();
  }

  final formkey = GlobalKey<FormState>();

  int _categoryId;

  int get categoryId => _categoryId;

  Future<void> reset() async {
    _topPromotionsImage = [];
    await Future.value([]);
    notifyListeners();
  }

  List<TopPromotions> _topPromotionsImage = [];

  List<TopPromotions> get topPromotionsImage => _topPromotionsImage;

  Future<void> gettopPromotionsImage() async {
    try {
      final topPromotionsImage = await apiServices.fetchPromotion();
      notifyListeners();

      _topPromotionsImage.addAll(topPromotionsImage);

      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
