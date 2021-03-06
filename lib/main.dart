// ignore_for_file: unused_local_variable, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/cart.dart';
import 'package:friends_supper_shop/provider/order.dart';
import 'package:friends_supper_shop/provider/products.dart';
import 'package:friends_supper_shop/screen/cart_screen.dart';
import 'package:friends_supper_shop/screen/edit_product_screen.dart';
import 'package:friends_supper_shop/screen/order_screen.dart';
import 'package:friends_supper_shop/screen/product_detailScreen.dart';
import 'package:friends_supper_shop/screen/products_overview_screen.dart';
import 'package:friends_supper_shop/screen/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Order())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName:(context) => OrderScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen()
        },
      ),
    );
  }
}
