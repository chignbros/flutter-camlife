import 'package:flutter/material.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/models/products_model.dart';
import 'package:sample_todo/src/models/promotion_model.dart';
import 'package:sample_todo/src/screens/about_us.dart';
import 'package:sample_todo/src/screens/budy_get_Bydy.dart';
import 'package:sample_todo/src/screens/buy_product.dart';
import 'package:sample_todo/src/screens/camlife_club.dart';
import 'package:sample_todo/src/screens/claim_process.dart';
import 'package:sample_todo/src/screens/claim_process_form_offline.dart';
import 'package:sample_todo/src/screens/claim_process_form_online.dart';
import 'package:sample_todo/src/screens/e_certificate.dart';
import 'package:sample_todo/src/screens/home.dart';
import 'package:sample_todo/src/screens/more_infor.dart';
import 'package:sample_todo/src/screens/product_detail.dart';
import 'package:sample_todo/src/screens/products_list.dart';
import 'package:sample_todo/src/screens/promotion_detail.dart';
import 'package:sample_todo/src/screens/splascreen.dart';

Route generatedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'splascreen':
      return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreens());
    case '/':
      return MaterialPageRoute(builder: (BuildContext context) => Home());
    case 'aboutUs':
      return MaterialPageRoute(builder: (BuildContext context) => AboutUS());
    case 'products':
      return MaterialPageRoute(
          builder: (BuildContext context) => ProductsList());
    case 'eCertificate':
      return MaterialPageRoute(
          builder: (BuildContext context) => Ecertificate());
    case 'camLifeClub':
      return MaterialPageRoute(
          builder: (BuildContext context) => CamlifeClub());
    case 'productDetail':
      var productDetail = settings.arguments as Products;
      return MaterialPageRoute(
          builder: (BuildContext context) => ProductDetail(
                product: productDetail,
              ));
    case 'promotionDetail':
      var promotion = settings.arguments as TopPromotions;
      return MaterialPageRoute(
          builder: (BuildContext context) => PromotionDetail(
                promotions: promotion,
              ));
    case 'buyProduct':
      var productDetail = settings.arguments as ProductDetailModel;
      return MaterialPageRoute(
          builder: (BuildContext context) => BuyProduct(
                productDetail: productDetail,
              ));
    case 'moreInfo':
      var productDetail = settings.arguments as ProductDetailModel;
      return MaterialPageRoute(
          builder: (BuildContext context) => MoreInfo(
                productDetail: productDetail,
              ));
    case 'claimProcess':
      return MaterialPageRoute(
          builder: (BuildContext context) => ClaimProcess());
    case 'claimProcessIsOnline':
      return MaterialPageRoute(
          builder: (BuildContext context) => ClaimProcesIsOnline());
    case 'claimProcessIsOffline':
      return MaterialPageRoute(
          builder: (BuildContext context) => ClaimProcessOffline());
    case 'buddyGetbuddy':
      return MaterialPageRoute(
          builder: (BuildContext context) => BudyGetBudy());
    default:
      return MaterialPageRoute(
        builder: (context) {
          return Text("Unknown");
        },
      );
  }
}

Map<String, WidgetBuilder> routes() {
  return {
    // When navigating to the "/" route, build the FirstScreen widget.
    'splascreen': (context) => SplashScreens(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/': (context) => Home(),
  };
}
