import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo/src/services/preference_service.dart';
import 'package:sample_todo/src/utils/custom_colors.dart';
import 'package:sample_todo/src/widget/alertDialog.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> menu = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    menu.add(MenuItem(
        title: 'About Us',
        icon: 'images/icons/AboutUs.png',
        route: 'aboutUs',
        borderRight: BorderSide(width: 0, color: Colors.grey),
        boderBottom: BorderSide(width: 0, color: Colors.grey)));
    menu.add(MenuItem(
        title: 'Products',
        icon: 'images/icons/Product.png',
        route: 'products',
        borderRight: BorderSide(width: 0, color: Colors.grey),
        boderBottom: BorderSide(width: 0, color: Colors.grey)));
    menu.add(MenuItem(
        title: 'E-Certificate',
        icon: 'images/icons/Ecertificate.png',
        route: 'eCertificate',
        borderRight: BorderSide.none,
        boderBottom: BorderSide(width: 0, color: Colors.grey)));
    menu.add(MenuItem(
        title: 'Claim',
        icon: 'images/icons/Claim.png',
        route: 'claimProcess',
        borderRight: BorderSide(width: 0, color: Colors.grey),
        boderBottom: BorderSide.none));
    menu.add(MenuItem(
        title: 'Buddy Get Buddy',
        icon: 'images/icons/BuddyGetBuddys.png',
        route: 'budyGetBudy',
        borderRight: BorderSide(width: 0, color: Colors.grey),
        boderBottom: BorderSide.none));
    menu.add(MenuItem(
        title: 'Camlife Club',
        icon: 'images/icons/CamlifeClub.png',
        route: 'camLifeClub',
        borderRight: BorderSide.none,
        boderBottom: BorderSide.none));
    void alertCamlifeClub() {
      Alerts.alertCamlifeClub(context, 'sfsfs', 'sfsfsjkfaskfbasjf',
          'sdfbasjfasysdfsfsfsfsfsfsfsfsufvasjyfayfa', () {
        Navigator.pop(context);
        Navigator.pushNamed(context, 'camLifeClub');
      });
    }

    void alertBudyGetBudy() {
      Alerts.alertBudyGetBudy(
          context, 'sfsfs', 'sdfbasjfasysdfsfsfsfsfsfsfsfsufvasjyfayfa', () {
        Navigator.pop(context);
        Navigator.pushNamed(context, 'buddyGetbuddy');
      });
    }

    return Container(
        color: Colors.white,
        height: height * 40 / 100,
        width: width,
        alignment: Alignment.center,
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(25),
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                final PreferenceService preferenceService =
                    Provider.of(context);
                final phone = await preferenceService.getPhone();
                if (menu[index].route == 'camLifeClub') {
                  if (phone == null) {
                    Alerts().showAlertInputPhone(context, navigateOk: () {
                      alertCamlifeClub();
                    }, navigateSkip: () {
                      alertCamlifeClub();
                    });
                  } else {
                    alertCamlifeClub();
                  }
                } else if (menu[index].route == 'budyGetBudy') {
                  if (phone == null) {
                    Alerts().showAlertInputPhone(context, navigateOk: () {
                      alertBudyGetBudy();
                    }, navigateSkip: () {
                      alertBudyGetBudy();
                    });
                  } else {
                    alertBudyGetBudy();
                  }
                } else if (menu[index].route == 'aboutUs') {
                  if (phone == null) {
                    Alerts().showAlertInputPhone(context, navigateOk: () {
                      Navigator.pushNamed(context, 'aboutUs');
                    }, navigateSkip: () {
                      Navigator.pushNamed(context, 'aboutUs');
                    });
                  } else {
                    Navigator.pushNamed(context, 'aboutUs');
                  }
                } else if (menu[index].route == 'products') {
                  if (phone == null) {
                    Alerts().showAlertInputPhone(context, navigateOk: () {
                      Navigator.pushNamed(context, 'products');
                    }, navigateSkip: () {
                      Navigator.pushNamed(context, 'products');
                    });
                  } else {
                    Navigator.pushNamed(context, 'products');
                  }
                } else {
                  Navigator.pushNamed(context, '${menu[index].route}');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: menu[index].borderRight,
                        bottom: menu[index].boderBottom)),
                width: width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          menu[index].icon,
                          fit: BoxFit.cover,
                        )),
                    Text(
                      menu[index].title,
                      style: TextStyle(color: MyColors.textColor, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class MenuItem {
  String title, route;
  String icon;
  BorderSide borderRight;
  BorderSide boderBottom;

  MenuItem(
      {this.icon, this.route, this.title, this.borderRight, this.boderBottom});
}
