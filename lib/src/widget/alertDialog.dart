import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/buy_product_provider.dart';
import 'package:sample_todo/src/providers/home_provider.dart';
import 'package:sample_todo/src/services/preference_service.dart';
import 'package:sample_todo/src/utils/content.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/utils/validator.dart';

class Alerts {
  static void showProductList(BuildContext context, Function(int) onTabIndex,
      {String title, List<dynamic> childen}) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  title: Center(
                      child: Text(
                    title,
                    style: TextStyle(color: Colors.black38),
                  )),
                  content: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: childen.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  onTabIndex(index);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      childen[index],
                                      style: subtitleIgdio,
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  static void alertCamlifeClub(BuildContext context, String title,
      String subTitle, String body, Function onClick) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.indigo[900]),
            ),
            content: HtmlWidget("""
           
            """),
            actions: <Widget>[
              FlatButton(onPressed: onClick, child: Text('OK')),
            ],
          );
        });
  }

  void showAlertInputPhone(BuildContext context,
      {Function navigateOk, Function navigateSkip}) {
    final TextEditingController _controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final PreferenceService _preferenceService = Provider.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          Content.phoneInput,
          style: dialogContenStyle,
          textAlign: TextAlign.justify,
        ),
        contentPadding: EdgeInsets.all(0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                validator: Validator.validatePhone,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).dividerColor,
            height: 1,
            width: double.infinity,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFECECEC),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  child: FlatButton(
                    child: Text("Skip"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      navigateSkip();
                    },
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _preferenceService.setPrePhone(_controller.text);
                      Navigator.of(context).pop();
                      navigateOk();
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static void alertBudyGetBudy(
      BuildContext context, String title, String body, Function ontab) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.indigo[900]),
            ),
            content: Container(
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  body,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: ontab, child: Text('OK')),
            ],
          );
        });
  }

  static void customBottomsSheet1(BuildContext context) {
    final BuyProductProvider butProduct = Provider.of(context);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            iconSize: 64,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              butProduct.openCamera1(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Camera'),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            iconSize: 64,
                            icon: Icon(
                              Icons.photo,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              butProduct.openGallery1(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Gallery'),
                        )
                      ],
                    )
                  ],
                )
              ],
            )));
  }

  static void customBottomsSheet2(BuildContext context) {
    final BuyProductProvider butProduct = Provider.of(context);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            iconSize: 64,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              butProduct.openCamera2(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Camera'),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            iconSize: 64,
                            icon: Icon(
                              Icons.photo,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              butProduct.openGallery2(context);
                            },
                          ),
                        ),
                        Container(
                          child: Text('Gallery'),
                        )
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
