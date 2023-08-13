// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:inventory_task/models/cart.dart';
import 'package:inventory_task/models/product.dart';

class AddToCart extends StatefulWidget {
  final catalog;
  const AddToCart({
    Key? key,
    this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    isInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          setState(() {
            isInCart = true;
            final _catalog = ProductModel();
            _cart.product = _catalog;
            _cart.add(widget.catalog);
          });
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart ? const Icon(Icons.done,) : const Icon(Icons.shopping_bag),
    );
  }
}
