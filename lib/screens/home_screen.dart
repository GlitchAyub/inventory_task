// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_task/models/product.dart';
import 'package:inventory_task/widgets/drawer.dart';
import 'package:inventory_task/widgets/home/product_list.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../utils/my_routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.token});

  final String title;
  final token;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String email;
  @override
  void initState() {
    loadData();
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'];
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    var productJson = await rootBundle.loadString('assets/file/products.json');
    var decodeData = jsonDecode(productJson);
    var productData = decodeData["product"];
    // log(productJson);
    ProductModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPageRoute),
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      drawer:  MyDrawer(email: email,),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ProductModel.items.isNotEmpty)
              const Expanded(child: ProductList())
            else
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
