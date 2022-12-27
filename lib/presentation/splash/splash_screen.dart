import 'package:flutter/material.dart';
import 'package:pixl_it/core/utils/app_assets.dart';
import 'package:pixl_it/core/utils/app_colors.dart';
import 'package:pixl_it/main.dart';
import 'package:pixl_it/presentation/splash/functions/splash_screen_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<SplashScreenFunctions>().init(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image(
            image: AssetImage(
              AppAssets.logo,
            ),
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
