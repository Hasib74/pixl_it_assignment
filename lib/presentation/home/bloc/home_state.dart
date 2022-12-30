part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<ProductModel> productList;
  final List<String> tabBarItems ;

  HomeLoaded({required this.productList , required this.tabBarItems});

  @override
  List<Object> get props => [productList];
}

class HomeTabChanged extends HomeState {

  String currentCategory = 'All';

  HomeTabChanged(this.currentCategory);
  @override
  List<Object> get props => [this.currentCategory];
}
