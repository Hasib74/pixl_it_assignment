import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pixl_it/core/routes/app_routes.dart';
import 'package:pixl_it/core/themes/app_themes.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';
import 'package:pixl_it/presentation/splash/bloc/splash_screen_cubit.dart';

import 'core/dependencyInjection/app_dependency_injections.dart';
import 'core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GetIt sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await intiGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor.withOpacity(0.6),
    ),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SplashScreenCubit(),
    ),
    BlocProvider(
      create: (context) => HomeCubit(productUseCase: sl()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeDataLight,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.SPLASH_SCREEN,
    );
  }
}
