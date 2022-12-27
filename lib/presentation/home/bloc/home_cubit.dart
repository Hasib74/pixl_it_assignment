import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixl_it/presentation/home/functions/home_functions.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/useCase/product_use_case.dart';
import '../../../main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductUseCase productUseCase;

  HomeCubit({required this.productUseCase}) : super(HomeInitial());

  Future getProductData() async {
    return sl<HomeFunctions>().getAllProductData(emit, productUseCase);
  }
}
