import 'package:borneofood_store/ui/pages/login_page.dart';
import 'package:borneofood_store/ui/pages/order_page.dart';
import 'package:borneofood_store/ui/pages/pages.dart';
import 'package:borneofood_store/ui/pages/register_page.dart';
import 'package:borneofood_store/ui/pages/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  FranchisePage.routeName: (context) => FranchisePage(),
  SelectionPage.routeName: (context) => SelectionPage(),
  BelanjaPage.routeName: (context) => BelanjaPage(),
  InfoPage.routeName: (context) => InfoPage(),
  KeranjangPage.routeName: (context) => KeranjangPage(),
  AkunPage.routeName: (context) => AkunPage(),
  FoodPage.routeName: (context) => FoodPage(),
  SearchPage.routeName: (context) => SearchPage(),
  FAQPage.routeName: (context) => FAQPage(),
  SignInNumberPage.routeName: (context) => SignInNumberPage(),
  SignInOTPPage.routeName: (context) => SignInOTPPage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  OrderPage.routeName: (context) => OrderPage(),
  SplashScreen.routeName: (context) => SplashScreen(),
};
