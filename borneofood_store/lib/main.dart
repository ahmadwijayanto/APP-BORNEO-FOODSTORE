import 'package:borneofood_store/cubit/banner_cubit.dart';
import 'package:borneofood_store/cubit/cart_cubit.dart';
import 'package:borneofood_store/cubit/category_cubit.dart';
import 'package:borneofood_store/cubit/transaction_cubit.dart';
import 'package:borneofood_store/cubit/user_cubit.dart';
import 'package:borneofood_store/routes.dart';
import 'package:borneofood_store/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'cubit/food_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => BannerCubit()),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => TransactionCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Borneo Food Store',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginPage.routeName,
        routes: routes,
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
