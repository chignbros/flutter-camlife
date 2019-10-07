import 'package:after_layout/after_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/home_provider.dart';
import 'package:sample_todo/src/services/preference_service.dart';
import 'package:sample_todo/src/utils/base_url.dart';
import 'package:sample_todo/src/utils/custom_colors.dart';
import 'package:sample_todo/src/widget/alertDialog.dart';
import 'package:sample_todo/src/widget/menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      centerTitle: true,
      title: Text(
        'Home',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 27),
      ),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    final appbarHeight = appbar.preferredSize.height;

    return Scaffold(
        backgroundColor: MyColors.backGroundColor,
        appBar: appbar,
        body: Consumer<HomeProvider>(
          builder: (context, HomeProvider homeProvider, _) {
            if (homeProvider.topPromotionsImage.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await homeProvider.reset();
                await homeProvider.gettopPromotionsImage();
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: ((height * 30 / 100) - statusbar - appbarHeight),
                    width: width,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset('images/logo1.png')),
                  ),
                  Menu(),
                  Container(
                    height: (height * 30) / 100,
                    width: width,
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                        child: CarouselSlider(
                      scrollPhysics: BouncingScrollPhysics(),
                      items: homeProvider.topPromotionsImage.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'promotionDetail',
                                    arguments: i);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${i.promotionImage}',
                                      ),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: Duration(seconds: 10),
                      scrollDirection: Axis.horizontal,
                    )),
                  )
                ],
              ),
            );
          },
        ));
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    final PreferenceService preferenceService = Provider.of(context);
    final phone = await preferenceService.getPhone();
    if (phone == null) {
      Alerts().showAlertInputPhone(context);
    }

    // print(Alerts().getPrePhone());
  }
}
