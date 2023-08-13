// ignore_for_file: unnecessary_getters_setters

import 'package:inventory_task/models/product.dart';

class CartModel {
  // singleton class
  static final cartModel = CartModel._internals();
  CartModel._internals();
  factory CartModel() => cartModel;

  // Product initialization and instances
  late ProductModel _product;

  // collection of ids
  final List<int> _itemIds = [];

  // get product
  ProductModel get product => _product;

  // set product
  set product(ProductModel newProduct) {
    _product = newProduct;
  }

// get items in the cart
  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();

// get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

// remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
