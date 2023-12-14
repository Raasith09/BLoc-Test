import 'package:bloctest/pages/home/bloc/home_bloc.dart';
import 'package:bloctest/pages/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDatamodel;
  final HomeBloc homebloc;
  const ProductTile(
      {super.key, required this.productDatamodel, required this.homebloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      productDatamodel.imageUrl,
                    ))),
          ),
          const SizedBox(height: 15),
          Text(
            productDatamodel.name,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            productDatamodel.description,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xff3D3D3D),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${productDatamodel.price}",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductWishlistButtonClickedEvent(
                            clickedProduct: productDatamodel));
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductCartButtonClickedEvent(
                            clickedProduct: productDatamodel));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
