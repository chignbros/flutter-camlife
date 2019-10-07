import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/providers/categorise_provider.dart';
import 'package:sample_todo/src/utils/base_url.dart';
import 'package:sample_todo/src/widget/appBar.dart';

class CamlifeClub extends StatefulWidget {
  @override
  _CamlifeClubState createState() => _CamlifeClubState();
}

class _CamlifeClubState extends State<CamlifeClub> {
  int _selectedIndex = 0;
  onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  Color bcolor = Colors.white;
  Color color = Colors.redAccent;

  bool press = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReuseAppBar.getAppBar(
          context,
          'Camlife Club',
        ),
        body: _buildBody());
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(245, 213, 211, 1),
          height: 50,
          child: Consumer<CategoriseProvider>(
            builder: (context, CategoriseProvider categoriseProvider, _) {
              return ListView.builder(
                itemCount: categoriseProvider.categorise.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = categoriseProvider.categorise[index];
                  if (index == 0) {
                    return Center(
                      child: InkWell(
                        onTap: () async {
                          await categoriseProvider.getAllActivePromotions();
                          onSelected(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? bcolor = Colors.redAccent
                                  : bcolor = Colors.white),
                          child: Text(
                            'All',
                            style: TextStyle(
                                fontSize: 13,
                                color: _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? color = Colors.white
                                    : color = Colors.redAccent),
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: InkWell(
                      onTap: () async {
                        categoriseProvider.reset();
                        await categoriseProvider
                            .getActivePromotions(category.id);

                        onSelected(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _selectedIndex != null &&
                                    _selectedIndex == index
                                ? bcolor = Colors.redAccent
                                : bcolor = Colors.white),
                        child: Text(
                          category.name,
                          style: TextStyle(
                              fontSize: 13,
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? color = Colors.white
                                  : color = Colors.redAccent),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Container(
          height: 45,
          color: Color.fromRGBO(245, 213, 211, 1),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: new InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffix: IconButton(
                  alignment: Alignment.bottomRight,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
                border: new OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                  color: Colors.grey,
                ),
                hintText: "Type Word",
                fillColor: Colors.white),
          ),
        ),
        listPromotion(_selectedIndex)
      ],
    );
  }

  listPromotion(int index) {
    return Flexible(
      child: Consumer<CategoriseProvider>(
        builder: (context, CategoriseProvider categoriseProvider, _) {
          if (categoriseProvider.topPromotions.length == 0) {
            return Center(
              child: Text(
                'No Promotion Available',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await categoriseProvider.reset();
              if (index == 0) {
                await categoriseProvider.reset();
                await categoriseProvider.getAllActivePromotions();
              } else {
                await categoriseProvider.reset();
                await categoriseProvider.getActivePromotions(
                    categoriseProvider.categorise[index].id);
              }
            },
            child: ListView.builder(
              itemCount: categoriseProvider.topPromotions.length,
              itemBuilder: (context, index) {
                final promotions = categoriseProvider.topPromotions[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'promotionDetail',
                        arguments: promotions);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  '${BaseUrl.baseUrlDevelopment}${BaseUrl.photoUri}${promotions.merchant.logoUrl}',
                                )),
                          ),
                        ),
                        Flexible(
                            child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 4),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                child: promotions.merchant.name == null
                                    ? promotions.merchant.name = ''
                                    : Text(
                                        promotions.merchant.name,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.indigo[900]),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 8),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                child: promotions.name == null
                                    ? promotions.name = ''
                                    : Text(
                                        promotions.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 15),
                                      )),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 1),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                child: promotions.description == null
                                    ? promotions.description = ''
                                    : Text(
                                        promotions.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 1),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                child: Text(
                                  "From: ${promotions.startDate.substring(0, 10)}-${promotions.endDate.substring(0, 10)}",
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        )),
                        Container(
                          width: 10,
                          height: 100,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
