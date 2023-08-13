import 'package:flutter/material.dart';
import 'package:inventory_task/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "CART",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartList(cart: cart),
          const Divider(),
        ],
      ),
      bottomNavigationBar: CartTotal(cart: cart),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartModel cart;
  const CartTotal({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "₹ ${cart.totalPrice}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(width: 30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Buying Not Supported yet"),
                ),
              );
            },
            style: const ButtonStyle(),
            child: const Text(
              "Buy",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel cart;
  const CartList({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty
        ? const Center(
            child: Text("Nothing to Show",
                style: TextStyle(fontSize: 30, color: Colors.black45)),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      cart.remove(item);
                    },
                  ),
                  title: Text(item.name),
                );
              },
            ),
          );
  }
}
