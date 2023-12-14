part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class CartInitialEvent extends CartBlocEvent {}

class CartRemovefromCartEvent extends CartBlocEvent {
  final ProductDataModel productDataModel;

  CartRemovefromCartEvent({required this.productDataModel});
}
