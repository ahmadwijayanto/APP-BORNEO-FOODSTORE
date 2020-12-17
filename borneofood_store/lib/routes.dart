
import 'package:borneofood_store/ui/pages/pages.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  FranchisePage.routeName: (context) => FranchisePage(),
  SelectionPage.routeName: (context) => SelectionPage(),
  BelanjaPage.routeName: (context) => BelanjaPage(),
  InfoPage.routeName: (context) => InfoPage(),
  KeranjangPage.routeName: (context) => KeranjangPage(),
  AkunPage.routeName: (context) => AkunPage(),
  ProductPage.routeName: (context) => ProductPage(),
  SearchPage.routeName: (context) => SearchPage(),
  FAQPage.routeName: (context) => FAQPage(),
  SignInNumberPage.routeName: (context) => SignInNumberPage(),
  SignInOTPPage.routeName: (context) => SignInOTPPage(),
};