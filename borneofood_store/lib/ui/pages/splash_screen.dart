import 'dart:async';

import 'package:borneofood_store/cubit/user_cubit.dart';
import 'package:borneofood_store/ui/pages/login_page.dart';
import 'package:borneofood_store/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = "/splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _time = Duration(seconds: 5);
    return Timer(_time, checkAuth);
  }

  void checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('api_token');

    if (token != null) {
      await context.read<UserCubit>().fecth(token);
      UserState state = context.read<UserCubit>().state;
      if (state is UserLoaded) {
        Get.offNamed(HomePage.routeName);
      } else {
        Get.offNamed(LoginPage.routeName);
      }
    } else {
      Get.offNamed(LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Image(
            image: AssetImage('assets/Logo.png'),
          ),
        ),
      ),
    );
  }
}
