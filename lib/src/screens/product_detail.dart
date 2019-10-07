import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/models/products_model.dart';
import 'package:sample_todo/src/services/home_service.dart';
import 'package:sample_todo/src/utils/base_url.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class ProductDetail extends StatelessWidget {
  final Products product;

  const ProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String btnName = 'More Information';
    return Scaffold(
        appBar: ReuseAppBar.getAppBar(context, product.name),
        body: FutureBuilder(
          future: Provider.of<ApiServices>(context)
              .fetchProductDetail(productId: product.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final productDetail = snapshot.data;
            if (productDetail.isOnline == true) {
              btnName = 'Buy Products';
            }
            return Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 30 / 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${productDetail.imageUrl}'))),
                ),
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      HtmlWidget(""" 
                  ${productDetail.description}
                  """, webView: true),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, left: 50, right: 50, bottom: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            if (productDetail.isOnline == true) {
                              Navigator.pushNamed(context, 'buyProduct',
                                  arguments: productDetail);
                            } else {
                              Navigator.pushNamed(context, 'moreInfo',
                                  arguments: productDetail);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              btnName,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
