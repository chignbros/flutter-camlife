import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/providers/buy_product_provider.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/utils/validator.dart';
import 'package:sample_todo/src/widget/alertDialog.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:image_picker_extended/image_picker_extended.dart';
import 'package:sample_todo/src/widget/customTextField.dart';

class BuyProduct extends StatefulWidget {
  final ProductDetailModel productDetail;

  const BuyProduct({
    Key key,
    this.productDetail,
  }) : super(key: key);

  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  final _formKey = GlobalKey<FormState>();
  int indexZ;
  var _paymentController = TextEditingController();
  var _assuredController = TextEditingController();
  var _premiumUsdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final BuyProductProvider buyProduct = Provider.of(context);
    final paymentType = widget.productDetail.productPaymentTypes
        .map((f) => f.paymentType)
        .toList();
    Future<void> _showPayment() async {
      Alerts.showProductList(context, (index) {
        Navigator.pop(context);
        _paymentController.text =
            widget.productDetail.productPaymentTypes[index].paymentType;
        indexZ = index;
        _premiumUsdController.clear();
        _assuredController.clear();
      }, title: 'Select Payment', childen: paymentType);
    }

    Future<void> _showSumAssured(int indexZ) async {
      final assuredList = widget
          .productDetail.productPaymentTypes[indexZ].priceLists
          .map((r) => r.sumAssured.toString())
          .toList();

      Alerts.showProductList(context, (index) {
        final amount =
            widget.productDetail.productPaymentTypes[indexZ].priceLists[index];
        Navigator.pop(context);

        _assuredController.text = amount.sumAssured.toString();
        _premiumUsdController.text = amount.premium.toString();
      }, title: 'Choose Amount', childen: assuredList);
    }

    void showBottomSheetCustom1() {
      final BuyProductProvider buyProduct = Provider.of(context);
      ImagePickerExtends().chooseImage(context, selectedImage: (file) {
        buyProduct.selectedImage1 = file;
      });
    }

    void showBottomSheetCustom2() {
      final BuyProductProvider buyProduct = Provider.of(context);
      ImagePickerExtends().chooseImage(context, selectedImage: (file) {
        buyProduct.selectedImage2 = file;
      });
    }

    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, 'Buy Product'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Center(
                child: Text(widget.productDetail.name, style: titleIgdio),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'We need your information below:',
                  style: subtitleIgdio,
                ),
              ),
              CustomTextField.normalText('Name', '*',
                  validate: Validator.validateName),
              CustomTextField.normalText('Phone Number', '*',
                  validate: Validator.validatePhone),
              CustomTextField.datePikerCustom('Date of Birth', '*'),
              CustomTextField.normalText(
                'Email',
                '',
              ),
              CustomTextField.normalText(
                'NID/Passport/Birth Certificate',
                '',
              ),
              CustomTextField.normalText(
                'Remark',
                '',
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Payment By',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Stack(
                              children: <Widget>[
                                TextField(
                                  readOnly: true,
                                  controller: _paymentController,
                                  style: TextStyle(fontSize: 17),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 5)),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.keyboard_arrow_down))
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => _showPayment(),
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sum Assured (USD)',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Stack(
                              children: <Widget>[
                                TextField(
                                  readOnly: true,
                                  controller: _assuredController,
                                  showCursor: false,
                                  style: TextStyle(fontSize: 17),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 5)),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.keyboard_arrow_down))
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        if (_paymentController.text.isNotEmpty) {
                          _showSumAssured(indexZ);
                        }
                      },
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Premium (USD)',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: TextField(
                        readOnly: true,
                        controller: _premiumUsdController,
                        style: TextStyle(fontSize: 17),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'NID/Passport/Birth Certificate',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () => showBottomSheetCustom1(),
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: buyProduct.selectedImage1 == null
                                            ? AssetImage('images/logo1.png')
                                            : FileImage(
                                                buyProduct.selectedImage1))),
                              )),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () => showBottomSheetCustom2(),
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: buyProduct.selectedImage2 == null
                                            ? AssetImage('images/logo1.png')
                                            : FileImage(
                                                buyProduct.selectedImage2))),
                              )),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('ok');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
