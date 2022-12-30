import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/useCase/product_use_case.dart';

class HomeFunctions {
  List<ProductModel>? productList = [];

  List<String> tabList = [];

  String currentCategory = 'All';


  setTabList(List<String> _tabList) {

    _tabList.insert(0, "All");

    this.tabList = _tabList.toSet().toList();

  }

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

      List<String>? _tabBarItems = [];

      productList!.forEach((element) {
        _tabBarItems.add(element.category!);
      });

      emit(HomeLoaded(
          productList: productList!,
          tabBarItems: _tabBarItems.toSet().toList()));
    }, (r) {
      print("Response : ${r}");

      //ScaffoldMessenger.of(context).me
    });
  }
}
