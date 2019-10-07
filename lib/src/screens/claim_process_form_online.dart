import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/utils/validator.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:sample_todo/src/widget/customButton.dart';
import 'package:sample_todo/src/widget/customTextField.dart';

class ClaimProcesIsOnline extends StatefulWidget {
  @override
  _ClaimProcesIsOnlineState createState() => _ClaimProcesIsOnlineState();
}

class _ClaimProcesIsOnlineState extends State<ClaimProcesIsOnline> {
  final _formKey = GlobalKey<FormState>();
  final _holderNameController = TextEditingController();
  final _holderBirthDateController = TextEditingController();

  final _holderNIDController = TextEditingController();
  final _holderPhoneController = TextEditingController();
  final _benificNameController = TextEditingController();
  final _benificBirthDateController = TextEditingController();
  final _benificNIDController = TextEditingController();
  final _benificPhoneController = TextEditingController();
  final _bennificEmailController = TextEditingController();
  String _seletedHolderSex;
  String _seletedBenificSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, 'Claim Process'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Please sumbit your claim here, and Camlife agent will contact you soon.',
                  style: subtitleIgdio,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Policy Holder Info',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              ),
              CustomTextField.normalText('Name', '*',
                  controller: _holderNIDController,
                  validate: Validator.validateName),
              CustomButton.dropDownButton((value) {
                setState(() {
                  _seletedHolderSex = value;
                });
              }, 'Sex', '*', _seletedHolderSex),
              CustomTextField.datePikerCustom('Date of Birth', '*'),
              CustomTextField.normalText('NID/Passport/Birth Certificate', '*',
                  controller: _holderNIDController,
                  validate: Validator.validateName),
              CustomTextField.normalText('Phone Number', '*',
                  controller: _holderPhoneController,
                  validate: Validator.validatePhone),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Benificiary Info',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
              ),
              CustomTextField.normalText('Name', '*',
                  controller: _benificNameController,
                  validate: Validator.validateName),
              CustomButton.dropDownButton((value) {
                setState(() {
                  _seletedBenificSex = value;
                });
              }, 'Sex', '*', _seletedBenificSex),
              CustomTextField.datePikerCustom('Date of Birth', '*'),
              CustomTextField.normalText('NID/Passport/Birth Certificate', '*',
                  controller: _benificNIDController,
                  validate: Validator.validateName),
              CustomTextField.normalText('Phone Number', '*',
                  controller: _benificPhoneController,
                  validate: Validator.validatePhone),
              CustomTextField.normalText(
                'Email',
                '',
                controller: _benificNameController,
              ),
              CustomButton.submitButton(context, () {
                if (_formKey.currentState.validate()) {}
              }),
            ],
          ),
        ),
      ),
    );
  }
}
