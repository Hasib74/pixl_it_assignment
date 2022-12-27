import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pixl_it/core/network/app_network.dart';

import 'package:pixl_it/main.dart';
import 'package:pixl_it/presentation/splash/functions/splash_screen_functions.dart';

import '../../data/remoteDataSource/product_data_source.dart';
import '../../data/respository/quiz_repository_impl.dart';
import '../../domain/useCase/product_use_case.dart';
import '../../presentation/home/functions/home_functions.dart';

Future intiGetIt() async {
  //Functions
  sl.registerSingleton(SplashScreenFunctions());
  sl.registerSingleton(HomeFunctions());

  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));

  sl.registerLazySingleton(() => ProductUseCase(
      producteRepository:
          ProductRepositoryImpl(productRemoteDataSource: sl())));

  sl.registerSingleton<ProductRemoteDataSource>(ProductRemoteDataSourceImpl());

//  sl.registerSingleton<Qu>(instance)

  // sl.registerSingleton<>(instance)
}
