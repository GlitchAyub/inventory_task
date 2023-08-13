// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:inventory_task/screens/cart_screen.dart';
import 'package:inventory_task/screens/home_screen.dart';
import 'package:inventory_task/screens/new_login_register/screens/login.dart';
import 'package:inventory_task/utils/my_routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // to check data is stored or not  in SharedPref
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString("token"),
  ));
}

class MyApp extends StatelessWidget {
  var token;
  MyApp({
    Key? key,
    required this.token,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: (JwtDecoder.isExpired(token) == false)
          ? MyHomePage(
              title: "Inventory",
              token: token,
            )
          : const SignInPage(),
      // initialRoute: MyRoutes.newLoginRoute,
      routes: {
        // MyRoutes.loginPageRoute: (context) => const LoginScreen(),
        // MyRoutes.registerPageRoute: (context) => const RegisterScreen(),
        // MyRoutes.homeRoute: (context) => const MyHomePage(title: "Inventory",token: "hello",),
        MyRoutes.cartPageRoute: (context) => const CartPage(),
        MyRoutes.newLoginRoute: (context) => const SignInPage()
      },
    );
  }
}
