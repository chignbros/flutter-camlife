import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/camlife_info_provider.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class AboutUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReuseAppBar.getAppBar(context, 'About Us'),
        body: Consumer<CamlifeProvider>(
          builder: (context, CamlifeProvider camlifeProvider, _) {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: HtmlWidget(""" 
                    ${camlifeProvider.infos.value}
                    """, webView: true)),
            );
          },
        ));
  }
}
