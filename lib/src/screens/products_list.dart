import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/products_provider.dart';
import 'package:sample_todo/src/utils/base_url.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, 'Products'),
      body: Consumer<ProductsProvider>(
        builder: (context, ProductsProvider productsProvider, _) {
          if (productsProvider.products.length == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              productsProvider.reset();
              await productsProvider.getProducts();
            },
            child: ListView.builder(
              itemCount: productsProvider.products.length,
              itemBuilder: (context, index) {
                final product = productsProvider.products[index];

                return Container(
                  child: GestureDetector(
                    onTap: () {
                      productsProvider.getProductDetail(product.id);
                      Navigator.pushNamed(context, 'productDetail',
                          arguments: product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: product.iconUrl == null
                                      ? NetworkImage(
                                          'images/logo1.pmg',
                                        )
                                      : NetworkImage(
                                          '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${product.iconUrl}',
                                        )),
                            ),
                          ),
                          Flexible(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  alignment: Alignment.topLeft,
                                  width: double.infinity,
                                  child: product.name == null
                                      ? Text(
                                          '',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      : Text(
                                          product.name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.indigo[900]),
                                        )),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  alignment: Alignment.topLeft,
                                  width: double.infinity,
                                  child: product.shortDescription == null
                                      ? Text(
                                          '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      : Text(
                                          product.shortDescription,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )),
                            ],
                          )),
                          Container(
                            width: 10,
                            height: 100,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
