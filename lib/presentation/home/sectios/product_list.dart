import 'package:flutter/material.dart';
import 'package:pixl_it/core/utils/app_dimension.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';
import 'package:pixl_it/presentation/home/widgets/app_product_card_widgets.dart';

import '../../../core/routes/app_routes.dart';
import '../../../domain/model/product_model.dart';

class ProductListSection extends StatelessWidget {
  List<ProductModel>? productList;

  ProductListSection({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: AppSpaces.defaultSpace * 1.5,
      mainAxisSpacing: AppSpaces.defaultSpace * 1.5,
      childAspectRatio: AppDimension.productCardAspectRatio,
      children: List.generate(productList!.length, (index) {
        return AppProductCardWidgets(
          id: productList![index].id.toString(),
          title: productList![index].title,
          price: productList![index].price.toString(),
          description: productList![index].description,
          category: productList![index].category,
          image: productList![index].image,
          rating: productList![index].rating,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.PRODUCT_DETAILS_SCREEN,
              arguments: {
                'id': productList![index].id.toString(),
                'title': productList![index].title,
                'price': productList![index].price.toString(),
                'description': productList![index].description,
                'category': productList![index].category,
                'image': productList![index].image,
                'rating': productList![index].rating,
              },
            );
          },
        );
      }),
    );
  }
}
