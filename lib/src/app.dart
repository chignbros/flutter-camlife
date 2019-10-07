import 'package:flutter/material.dart';
import 'package:sample_todo/src/provider_setup.dart';
import 'package:provider/provider.dart';
import 'routes_setup.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: 'splascreen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.indigo[900]),
        onGenerateRoute: generatedRoutes,
        routes: routes(),
      ),
    );
  }
}
