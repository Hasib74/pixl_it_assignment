import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixl_it/core/utils/app_colors.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';

import '../../../domain/model/product_model.dart';
import '../../_common/widgets/category_name_widget.dart';

class AppProductCardWidgets extends StatelessWidget {
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  VoidCallback? onTap;

  AppProductCardWidgets({
    Key? key,
    this.image,
    this.title,
    this.price,
    this.description,
    this.category,
    this.rating,
    this.id,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              _image(),
              _background(),
              _buttomSection(),
              _category(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _image() {
    return Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(image!),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }

  _buttomSection() {
    return Positioned(
      bottom: 16,
      left: 8,
      right: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!.split(" ")[0],
            style: TextStyle(
              color: AppColors.textColorOne,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpaces.spacesHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + price!,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.primaryColor, size: 18),
                  Text(
                    rating!.rate.toString(),
                    style: TextStyle(
                      color: AppColors.textColorOne,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _background() {
    return Positioned.fill(
        child: RotatedBox(
      quarterTurns: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black.withOpacity(0.3),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black.withOpacity(0.0),
              AppColors.black.withOpacity(1),
            ],
          ),
        ),
      ),
    ));
  }

  _category() {
    return Positioned(
        top: 8, right: 8, child: CategoryNameWidget(name: category));
  }
}
