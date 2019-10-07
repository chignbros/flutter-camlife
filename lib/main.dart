import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';

void main() {
  runApp(App());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( // navigation bar color
    statusBarColor: Colors.indigo[900], // status bar color
  ));
  
  
  }
