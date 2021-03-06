import 'dart:async';
import 'package:flutter/material.dart';

import 'package:sandra_app/screens/components/constants.dart';
import 'package:sandra_app/screens/home/home_cubit/home_cubit.dart';
import 'package:sandra_app/screens/login_or_signup_screen/login_or_signup_screen.dart';
import 'body.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    HomeCubit.get(context).getAllProducts();
    HomeCubit.get(context).getProducts(id: '', brandId: '');
    HomeCubit.get(context).getCategories();
    HomeCubit.get(context).getShops();
    HomeCubit.get(context).getBanners();
    HomeCubit.get(context).getAllOffers();
    HomeCubit.get(context).getProductDetails(id: '');
    HomeCubit.get(context).contactInfo();
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginOrSignupScreen())));
    // getScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#ffcdd2'),
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SplashBody(),
    );
  }
}
