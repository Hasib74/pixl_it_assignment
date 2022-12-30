import 'package:flutter/material.dart';
import 'package:pixl_it/core/utils/app_dimension.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';
import 'package:pixl_it/main.dart';
import 'package:pixl_it/presentation/home/functions/home_functions.dart';
import 'package:pixl_it/presentation/home/widgets/app_product_card_widgets.dart';

import '../../../core/routes/app_routes.dart';
import '../../../domain/model/product_model.dart';

class ProductListSection extends StatelessWidget {
  List<ProductModel>? productList;

  ProductListSection({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _productList = List.from(productList!);

    if (sl<HomeFunctions>().currentCategory != "All") {
      _productList.removeWhere(
          (element) => element.category != sl<HomeFunctions>().currentCategory);
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: AppSpaces.defaultSpace * 1.5,
      mainAxisSpacing: AppSpaces.defaultSpace * 1.5,
      childAspectRatio: AppDimension.productCardAspectRatio,
      children: List.generate(_productList!.length, (index) {
        return AppProductCardWidgets(
          id: _productList[index].id.toString(),
          title: _productList[index].title,
          price: _productList[index].price.toString(),
          description: _productList[index].description,
          category: _productList[index].category,
          image: _productList[index].image,
          rating: _productList[index].rating,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.PRODUCT_DETAILS_SCREEN,
              arguments: {
                'id': _productList[index].id.toString(),
                'title': _productList[index].title,
                'price': _productList[index].price.toString(),
                'description': _productList[index].description,
                'category': _productList[index].category,
                'image': _productList[index].image,
                'rating': _productList[index].rating,
              },
            );
          },
        );
      }),
    );
  }
}
