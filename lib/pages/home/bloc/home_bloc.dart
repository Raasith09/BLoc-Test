import 'dart:async';

import 'package:bloctest/data/cart_items.dart';
import 'package:bloctest/data/grocery_data.dart';
import 'package:bloctest/data/wishlist_items.dart';
import 'package:bloctest/pages/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeBloc() : super(HomeblocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductCartNavigation>(homeProductCartNavigation);

    on<HomeProductWishlistNavigation>(homeProductWishlistNavigation);
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeblocState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductCartNavigation(
      HomeProductCartNavigation event, Emitter<HomeblocState> emit) {
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeProductWishlistNavigation(
      HomeProductWishlistNavigation event, Emitter<HomeblocState> emit) {
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeblocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: Groceries.groceryProducts
            .map((e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imageUrl: e["image"]))
            .toList()));
  }
}
