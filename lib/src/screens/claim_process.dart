import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/products_provider.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/widget/alertDialog.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class ClaimProcess extends StatefulWidget {
  @override
  _ClaimProcessState createState() => _ClaimProcessState();
}

class _ClaimProcessState extends State<ClaimProcess> {
  final _productListController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, ProductsProvider productsProvider, _) {
        final childen = productsProvider.products.map((p) => p.name).toList();
        void _showProductList() {
          Alerts.showProductList(
            context,
            (index) {
              Navigator.pop(context);
              _productListController.text = childen[index];
              if (productsProvider.products[index].isOnline == true) {
                Navigator.pushNamed(context, 'claimProcessIsOnline');
              } else {
                Navigator.pushNamed(context, 'claimProcessIsOffline');
              }
            },
            title: "Select a Product",
            childen: childen,
          );
        }

        return Scaffold(
            appBar: ReuseAppBar.getAppBar(
              context,
              'Claim Process',
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Please select the product to fill the claim',
                      style: subtext,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Product',
                      style: subtext,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          enabled: false,
                          controller: _productListController,
                          showCursor: false,
                          decoration: InputDecoration(
                              hintText: 'Select a product',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black38),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 5)),
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () => _showProductList(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
