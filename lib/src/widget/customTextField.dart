import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/utils/validator.dart';

class CustomTextField {
  static normalText(String title, String preFix,
      {FormFieldValidator<String> validate, TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: preFix,
                style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(text: title, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: TextFormField(
              controller: controller,
              validator: validate,
              style: TextStyle(fontSize: 17),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5)),
            ),
          )
        ],
      ),
    );
  }

  static datePikerCustom(String name, String preFix,
      {TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: preFix,
                style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(text: name, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: DateTimeField(
              readOnly: true,
              controller: controller,
              validator: Validator.validateDate,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    size: 24,
                  )),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
        ],
      ),
    );
  }
}
