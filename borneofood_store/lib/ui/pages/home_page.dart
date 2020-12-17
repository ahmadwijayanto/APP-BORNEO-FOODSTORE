// import 'package:borneofood_store/shared/shared.dart';
// import 'package:borneofood_store/ui/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

part of 'pages.dart';

class HomePage extends StatelessWidget {
  static final routeName = "/home_page";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Center(
            child: Text(
          'Borneo Food Store',
          style: appBarText,
        )),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Container(
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(200),
                child: Image(image: AssetImage('assets/Logo.png')),
              ),
            ),
            addVerticalSpace(getProportionateScreenHeight(50)),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30)),
                child: buttonList(getProportionateScreenHeight(15), context),
              ),
            )
          ],
        ),
      )),
    );
  }
}

Column buttonList(double spaceBetween, BuildContext context) {
  return Column(
    children: <Widget>[
      HomeButton(
        text: 'Belanja Bayar Online',
        onTap: () {
          Navigator.pushNamed(context, SelectionPage.routeName,
              arguments: ScreenArguments(0, true));
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Kategori Produk Daging',
        onTap: () {
          Navigator.pushNamed(context, SelectionPage.routeName,
              arguments: ScreenArguments(0, false));
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Kategori Produk Seafood',
        onTap: () {
          Navigator.pushNamed(context, SelectionPage.routeName,
              arguments: ScreenArguments(0, false));
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Belanja Bayar COD',
        onTap: () {
          launch('https://wa.me/628115749996');
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Media Sosial',
        onTap: () {
          launch('https://instagram.com/borneofoodstore');
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Info Reseller',
        onTap: () {
          launch('https://wa.me/628125886786');
        },
      ),
      addVerticalSpace(spaceBetween),
      HomeButton(
        text: 'Franchise Bakso',
        onTap: () {
          Navigator.pushNamed(context, FranchisePage.routeName);
        },
      ),
    ],
  );
}
