import 'package:flutter/material.dart';
import 'package:inventory_task/models/product.dart';
import 'package:inventory_task/screens/home_details.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModel.items.length,
      itemBuilder: (context, index) {
        //  storing model in variable
        final product = ProductModel.items[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetails(product: product),
            ),
          ),
          child: ItemWidget(
            product: product,
          ),
        );
      },
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      child: ListTile(
        // onTap: () {},
        leading: Hero(
          tag: Key(product.id.toString()),
          child:
              Image(height: 80, width: 70, image: NetworkImage(product.image)),
        ),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          ' ₹ ${product.price}',
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// class ProductItem extends StatelessWidget {
//   final Item product;
//   const ProductItem({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(60, 195, 194, 194),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         children: [
//           Hero(
//             tag: Key(product.id.toString()),
//             child: Image(
//                 height: 80, width: 70, image: NetworkImage(product.image)),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 10),
//                 Text(
//                   product.name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   product.desc,
//                   style: const TextStyle(fontSize: 10),
//                   maxLines: 2,
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '₹ ${product.price}',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     AddToCart(catalog: product),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
