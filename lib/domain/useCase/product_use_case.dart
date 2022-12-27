import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pixl_it/core/error/failures.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/model/model.dart';
import 'package:pixl_it/core/useCase/useCase.dart';

import '../repository/product_repository.dart';


class ProductUseCase extends UseCase<AppApiResponse, ProductParams> {
  ProductRepository? producteRepository;

  ProductUseCase({required this.producteRepository});

  @override
  Future<Either<AppApiResponse<Model>, Failure>> call(ProductParams params) async {
    if (params is GetProductParms) {
      return producteRepository!.getProducte();
    } else {
      return Right(UnImplement());
    }
  }
}

class ProductParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetProductParms extends ProductParams {}
