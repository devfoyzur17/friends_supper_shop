// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/data/product_data.dart';
import 'package:friends_supper_shop/widget/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Friends supper shop!")),
        body: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: loadedProduct.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => ProductItem(id: loadedProduct[index].id, title:  loadedProduct[index].title, imageUrl:  loadedProduct[index].imageUrl)));
  }
}
