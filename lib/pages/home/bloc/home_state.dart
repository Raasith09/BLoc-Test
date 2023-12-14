part of 'home_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeblocActionState extends HomeblocState {}

class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadedSuccessState extends HomeblocState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeblocState {}

class HomeNavigateToWishlistActionState extends HomeblocActionState {}

class HomeNavigateToCartActionState extends HomeblocActionState {}

class HomeProductItemWishlistedActionState extends HomeblocActionState {}

class HomeProductItemCartedActionState extends HomeblocActionState {}
