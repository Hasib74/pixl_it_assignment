import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixl_it/core/extension/string_extendion.dart';
import 'package:pixl_it/core/utils/app_colors.dart';
import 'package:pixl_it/presentation/home/bloc/home_cubit.dart';
import 'package:pixl_it/presentation/home/functions/home_functions.dart';

import '../../../core/utils/app_spaces.dart';
import '../../../main.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeLoaded? homeLoadedState;

      HomeTabChanged? homeTabChangedState;
      if (state is HomeInitial) {
        return Container();
      } else if (state is HomeLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HomeLoaded) {
        sl<HomeFunctions>().setTabList(state.tabBarItems);

        homeLoadedState = state;
      } else if (state is HomeTabChanged) {
        homeTabChangedState = state;
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(

          height: 30,
          child: ListView.separated(
            itemCount: sl<HomeFunctions>().tabList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<HomeCubit>(context)
                      .changeTab(sl<HomeFunctions>().tabList[index]);


                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: sl<HomeFunctions>().tabList[index] ==
                              sl<HomeFunctions>().currentCategory
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16,top: 4,bottom: 6),
                      child: Text(sl<HomeFunctions>().tabList[index].toCapitalized(),
                          style: TextStyle(
                              color: sl<HomeFunctions>().tabList[index] ==
                                      sl<HomeFunctions>().currentCategory
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5)) ,textAlign: TextAlign.center,),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 15);
            },
          ),
        ),
      );
    });
  }
}
