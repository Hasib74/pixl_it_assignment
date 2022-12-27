import 'package:dartz/dartz.dart';
import 'package:pixl_it/core/error/failures.dart';
import 'package:pixl_it/core/network/app_network.dart';
import 'package:pixl_it/core/remoteHelper/app_urls.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/model/model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

abstract class ProductRemoteDataSource {
  Future<Either<AppApiResponse, Failure>> getProducte();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<Either<AppApiResponse<Model>, Failure>> getProducte() async {

      print("Is connectedwith internet : ${await sl<AppNetworkInfo>().isConnected}") ;

    if (await sl<AppNetworkInfo>().isConnected) {
      // try {
      //
      // } catch (err) {
      //   print("server error for : ${err.toString()}");
      //   return Right(ServerFailure(err.toString()));
      // }

      http.Response _res = await http.get(Uri.parse(AppUri.products));

      print("Current _response :: ${_res.body}");

      return Left(AppApiResponse.data(
        response: _res,
      ));
    } else {
      return Right(NoInternetConnection());
    }
  }
}
