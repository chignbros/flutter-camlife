import 'package:flutter/material.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/widget/appBar.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Ecertificate extends StatefulWidget {
  @override
  _EcertificateState createState() => _EcertificateState();
}

class _EcertificateState extends State<Ecertificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, 'E-Certificate'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 140,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset('images/logo1.png')),
                ),
              ),
              Divider(
                indent: 30,
                endIndent: 30,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Please log in with your policy infomation',
                    style: TextStyle(color: Colors.indigo[900]),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number (Later become policy number)'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DateTimeField(
                  decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      suffixIcon: Icon(Icons.calendar_today)),
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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                    onPressed: () {},
                    color: Colors.redAccent,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Note: If you fail to log in:',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      '1. You are not our policy holder yet, please got to the products page;',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      '2. You are a new policy holder, so your data has not been uploaded into the system yet,please come back in few das;',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      '3. Contact our inbound call center at 061431111;',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
