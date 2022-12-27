import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixl_it/core/routes/app_routes.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';
import 'package:pixl_it/presentation/_common/widgets/app_button.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';
import 'package:pixl_it/presentation/home/sectios/product_list.dart';

import '../../core/utils/app_colors.dart';
import '../../domain/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  String? id;
  String? title;
  String? price;
  String? description;

  String? category;
  String? image;
  Rating? rating;

  ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    id = arguments['id'];
    title = arguments['title'];
    price = arguments['price'];
    description = arguments['description'];
    category = arguments['category'];
    image = arguments['image'];
    rating = arguments['rating'];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(children: [
        _image(context),
        _title_price_rating(context),

        AppSpaces.spacesHeight15,
        AppSpaces.spacesHeight15,
        Expanded(child: _description(context)),
      ]),
    );
  }

  Column _title_price_rating(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
        AppSpaces.spacesHeight15,
        Row(
          children: [
            Text(
              "\$" + price!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  rating!.rate.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Stack _image(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover),
          ),
        ),
        Positioned(
            top: 16 * 3,
            left: 16,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                ))),
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.scaffoldBackgroundColor.withOpacity(0.1),
            AppColors.scaffoldBackgroundColor.withOpacity(0.2),
            AppColors.scaffoldBackgroundColor.withOpacity(0.7),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ))
      ],
    );
  }

  _description(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        description!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
