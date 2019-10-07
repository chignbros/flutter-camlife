import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/validator.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:sample_todo/src/widget/customButton.dart';
import 'package:sample_todo/src/widget/customTextField.dart';

class ClaimProcessOffline extends StatefulWidget {
  @override
  _ClaimProcessOfflineState createState() => _ClaimProcessOfflineState();
}

class _ClaimProcessOfflineState extends State<ClaimProcessOffline> {
  final _forKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, 'Claim Processes'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _forKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                    'Please sumbit your claim here, and Camlife agent will contact you soon'),
              ),
              CustomTextField.normalText('Policy Number', '*',
                  validate: Validator.validatePhone),
              CustomTextField.normalText('Company Name', ''),
              CustomTextField.normalText('Contact Person Name', '*',
                  validate: Validator.validateName),
              CustomTextField.normalText('Contact Person Number', '*',
                  validate: Validator.validatePhone),
              CustomButton.submitButton(context, () {
                if (_forKey.currentState.validate()) {}
              })
            ],
          ),
        ),
      ),
    );
  }
}
