import 'package:bloctest/pages/cart/ui/cart.dart';
import 'package:bloctest/pages/home/bloc/home_bloc.dart';
import 'package:bloctest/pages/home/ui/product_tile_widget.dart';
import 'package:bloctest/pages/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeblocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeblocActionState,
      buildWhen: (previous, current) => current is! HomeblocActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistPage()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item carted")));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item wishlisted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text(
                    "Grocery App",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWishlistNavigation());
                        },
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartNavigation());
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        )),
                  ]),
              body: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                child: ListView.builder(
                    itemCount: successState.products.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProductTile(
                        productDatamodel: successState.products[index],
                        homebloc: homeBloc,
                      );
                    }),
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
