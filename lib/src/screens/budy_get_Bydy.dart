import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/validator.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:sample_todo/src/widget/customButton.dart';
import 'package:sample_todo/src/widget/customTextField.dart';

class BudyGetBudy extends StatefulWidget {
  @override
  _BudyGetBudyState createState() => _BudyGetBudyState();
}

class _BudyGetBudyState extends State<BudyGetBudy> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReuseAppBar.getAppBar(context, 'Buddy Get Buddy'),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                      'Enjoy Camlife Buddy here. Camlife agent will contact you soon.'),
                ),
                CustomTextField.normalText('Your Name', '*',
                    validate: Validator.validateName),
                CustomTextField.normalText('Your Phone Number', '*',
                    validate: Validator.validatePhone),
                CustomTextField.normalText('Your Buddy Name', '*',
                    validate: Validator.validateName),
                CustomTextField.normalText('Your Buddy Person Number', '*',
                    validate: Validator.validatePhone),
                CustomTextField.normalText(
                  'Your Buddy Email',
                  '',
                ),
                CustomButton.submitButton(context, () {
                  if (_formKey.currentState.validate()) {}
                })
              ],
            ),
          ),
        ));
  }
}
