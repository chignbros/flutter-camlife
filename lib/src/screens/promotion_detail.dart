import 'package:flutter/material.dart';
import 'package:sample_todo/src/models/promotion_model.dart';
import 'package:sample_todo/src/utils/base_url.dart';
import 'package:sample_todo/src/utils/textStyle.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class PromotionDetail extends StatelessWidget {
  final TopPromotions promotions;

  const PromotionDetail({Key key, this.promotions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: ReuseAppBar.getAppBar(context, '${promotions.merchant.name}'),
      body: _buildBody(height),
    );
  }

  _buildBody(double height) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 30 / 100,
                  child: Image.network(
                    '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${promotions.promotionImage}',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(top: (height * 30 / 100) - 8),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Text(
                                promotions.merchant.name,
                                style: TextStyle(
                                    color: Colors.indigo[900], fontSize: 17),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              promotions.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              promotions.description,
                              style: subtext,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 15),
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'From ',
                                    style: subtext,
                                  ),
                                  Text(
                                    '${promotions.startDate.substring(0, 10)} to ${promotions.endDate.substring(0, 10)}',
                                    style: subtextBold,
                                  ),
                                ],
                              )),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Merchant Info',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.indigo[900]),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child:
                                Text(promotions.merchant.info, style: subtext),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: 100,
                                      child: Text(
                                        'Address',
                                        style: subtextBold,
                                      )),
                                  Container(
                                    child: Text(
                                      ':  ',
                                      style: subtextBold,
                                    ),
                                  ),
                                  Flexible(
                                    child: promotions.merchant.address == null
                                        ? Text('')
                                        : Text(
                                            '${promotions.merchant.address}',
                                            style: subtext,
                                          ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: 100,
                                      child: Text(
                                        'Tel',
                                        style: subtextBold,
                                      )),
                                  Container(
                                    child: Text(
                                      ':  ',
                                      style: subtextBold,
                                    ),
                                  ),
                                  Flexible(
                                    child: promotions.merchant.tel == null
                                        ? Text('')
                                        : Text(
                                            '${promotions.merchant.tel}',
                                            style: subtext,
                                          ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: 100,
                                      child: Text(
                                        'Fax',
                                        style: subtextBold,
                                      )),
                                  Container(
                                    child: Text(
                                      ':  ',
                                      style: subtextBold,
                                    ),
                                  ),
                                  Flexible(
                                    child: promotions.merchant.fax == null
                                        ? Text('')
                                        : Text(
                                            '${promotions.merchant.fax}',
                                            style: subtext,
                                          ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: 100,
                                      child: Text(
                                        'Email',
                                        style: subtextBold,
                                      )),
                                  Container(
                                    child: Text(
                                      ':  ',
                                      style: subtextBold,
                                    ),
                                  ),
                                  Flexible(
                                    child: promotions.merchant.email == null
                                        ? Text('')
                                        : Text(
                                            '${promotions.merchant.email}',
                                            style: subtext,
                                          ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      width: 100,
                                      child: Text(
                                        'Website',
                                        style: subtextBold,
                                      )),
                                  Container(
                                    child: Text(
                                      ':  ',
                                      style: subtextBold,
                                    ),
                                  ),
                                  Flexible(
                                    child: promotions.merchant.website == null
                                        ? Text('')
                                        : Text(
                                            '${promotions.merchant.website}',
                                            style: subtext,
                                          ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: (height * 30 / 100) - 45),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0, color: Colors.grey)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${promotions.merchant.logoUrl}'))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
