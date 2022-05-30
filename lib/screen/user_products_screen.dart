// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/widget/app_drawer.dart';
import 'package:friends_supper_shop/widget/user_product_item.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  static final routeName = "user-products-screen";

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your products"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: productData.item.length,
        itemBuilder: (context, index) => Column(
          children: [
            UserProductItem(title: productData.item[index].title, imageUrl: productData.item[index].imageUrl),
            Divider()
          ],
        )),
      ),
    );
  }
}
