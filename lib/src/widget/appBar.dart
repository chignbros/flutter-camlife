import 'package:flutter/material.dart';

class ReuseAppBar {
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 27),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            iconSize: 32,
            icon: Icon(Icons.home),
            onPressed: () async {
              Navigator.popUntil(context, (r) => r.settings.name == '/');
            })
      ],
    );
  }
}
