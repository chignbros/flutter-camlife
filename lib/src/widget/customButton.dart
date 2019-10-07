import 'package:flutter/material.dart';

class CustomButton {
  static submitButton(
    BuildContext context,
    Function onPressed,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        color: Colors.red,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  static dropDownButton(Function onTab(String value), String title,
      String preFix, String selectedSex) {
    final List<String> _dropdownValues = ['Male', 'Femal'];
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
              width: double.infinity,
              padding: EdgeInsets.only(left: 5),
              child: DropdownButton(
                value: selectedSex == null ? _dropdownValues[0] : selectedSex,
                items: _dropdownValues
                    .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                onChanged: (value) => onTab(value),
                isExpanded: false,
              ))
        ],
      ),
    );
  }
}
