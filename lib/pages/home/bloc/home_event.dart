part of 'home_bloc.dart';

@immutable
sealed class HomeblocEvent {}

class HomeInitialEvent extends HomeblocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeblocEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartNavigation extends HomeblocEvent {}

class HomeProductWishlistNavigation extends HomeblocEvent {}
