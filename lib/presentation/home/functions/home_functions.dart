import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/useCase/product_use_case.dart';

class HomeFunctions {
  List<ProductModel>? productList = [];

  Future getAllProductData(void Function(HomeState state) emit,
      ProductUseCase productUseCase) async {
    var _res = await productUseCase.call(GetProductParms());

    _res.fold((l) {
      List<dynamic> _data = jsonDecode(l.body!);

      _data.forEach((element) {
        print("PRODUCT Response ---- > ${element}");

        productList?.add(ProductModel.fromJson(element));
      });

      print("Response List: ${productList!}");

      emit(HomeLoaded(productList: productList!));
    }, (r) {
      print("Response : ${r}");

      //ScaffoldMessenger.of(context).me
    });
  }
}
