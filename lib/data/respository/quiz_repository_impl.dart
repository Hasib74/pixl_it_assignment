import 'package:dartz/dartz.dart';
import 'package:pixl_it/core/error/failures.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:pixl_it/core/remoteHelper/responseHelper/model/model.dart';

import '../../domain/repository/product_repository.dart';
import '../remoteDataSource/product_data_source.dart';


class ProductRepositoryImpl extends ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<AppApiResponse<Model>, Failure>> getProducte() {
    return productRemoteDataSource.getProducte();
  }
}
