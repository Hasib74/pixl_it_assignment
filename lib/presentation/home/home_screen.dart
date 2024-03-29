import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixl_it/core/routes/app_routes.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';
import 'package:pixl_it/main.dart';
import 'package:pixl_it/presentation/_common/widgets/app_button.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';
import 'package:pixl_it/presentation/home/functions/home_functions.dart';
import 'package:pixl_it/presentation/home/sectios/home_tap_bar.dart';
import 'package:pixl_it/presentation/home/sectios/product_list.dart';

import '../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var productList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          'Pixl IT',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Container();
          } else if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
             productList = state.productList;

          }

          return Column(
            children: [
              HomeTabBar(),
              Expanded(
                  child: ProductListSection(
                    productList: sl<HomeFunctions>().productList,
                  ))
            ],
          );
        },
      ),
    );
  }
}
