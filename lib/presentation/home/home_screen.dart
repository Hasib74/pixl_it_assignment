import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixl_it/core/routes/app_routes.dart';
import 'package:pixl_it/core/utils/app_spaces.dart';
import 'package:pixl_it/presentation/_common/widgets/app_button.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';
import 'package:pixl_it/presentation/home/sectios/product_list.dart';

import '../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            var productList = state.productList;

            return Center(
              child: ProductListSection(
                productList: productList,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
