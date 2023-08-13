import 'package:flutter/material.dart';
import 'package:inventory_task/models/product.dart';

import '../widgets/home/add_to_cart.dart';

class HomeDetails extends StatelessWidget {
  final Item product;
  const HomeDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " ₹ ${product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            AddToCart(
              catalog: product,
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: Key(product.id.toString()),
                child: Image.network(product.image),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      product.desc,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Consetetur justo sit lorem sadipscing at ipsum dolor dolore dolor sadipscing. Diam diam sed ipsum amet tempor no takimata lorem, sed stet consetetur est ea no consetetur sea ut accusam. Amet lorem rebum clita justo ipsum aliquyam stet. Sanctus aliquyam dolore kasd sea, sea sea ipsum et labore. Lorem et.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
