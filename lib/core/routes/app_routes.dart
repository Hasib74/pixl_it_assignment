import 'package:flutter/material.dart';
import 'package:pixl_it/presentation/home/home_screen.dart';
import 'package:pixl_it/presentation/splash/splash_screen.dart';

import '../../presentation/productDetails/product_details_screen.dart';

class AppRoutes {
  static String SPLASH_SCREEN = "/";
  static String HOME_SCREEN = "/home";
  static String PRODUCT_DETAILS_SCREEN = "/product_details";

  static getAppRoutes() {
    return {
      SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
      HOME_SCREEN: (BuildContext context) => const HomeScreen(),
      PRODUCT_DETAILS_SCREEN : (BuildContext context) =>  ProductDetailsScreen(),
    };
  }
}
