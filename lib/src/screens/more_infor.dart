import 'package:flutter/material.dart';
import 'package:sample_todo/src/models/product_detail_model.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/utils/validator.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:sample_todo/src/widget/customButton.dart';
import 'package:sample_todo/src/widget/customTextField.dart';

class MoreInfo extends StatefulWidget {
  final ProductDetailModel productDetail;

  const MoreInfo({Key key, this.productDetail}) : super(key: key);
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReuseAppBar.getAppBar(context, 'More Information'),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
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
                CustomTextField.normalText('Email', ''),
                CustomTextField.normalText(
                    'NID/Passport/Birth Certificate', ''),
                CustomTextField.normalText('Remark', ''),
                CustomButton.submitButton(context, () {
                  if (_formKey.currentState.validate()) {}
                })
              ]),
            )));
  }
}
