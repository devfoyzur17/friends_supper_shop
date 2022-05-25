

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavorite;
  const ProductsGridView(this.showFavorite, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =showFavorite? productData.favoriteItem: productData.item;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          
          value: products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl
              ),
        ));
  }
}
