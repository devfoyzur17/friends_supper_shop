// ignore_for_file: sort_child_properties_last, prefer_typing_uninitialized_variables, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/cart.dart';
import 'package:friends_supper_shop/screen/product_detailScreen.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  const ProductItem(
      {  Key? key})
      : super(key: key);

      

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return  ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              title: Text(product.title),
              backgroundColor: Colors.black.withOpacity(0.7),
              leading:  Consumer<Product>(
               builder: (context, product, child) =>  IconButton(
                onPressed: () {product.toggoleFavouriteStatus();},
                icon: Icon(product.isFavourite? Icons.favorite:Icons.favorite_outline_outlined, color: Colors.deepOrange,),
              ),),
              trailing:
                  IconButton(onPressed: () {
                    cart.addItem(product.id, product.price, product.title);
                  }, icon: Icon( Icons.shopping_cart,color: Colors.red,)),
            ),
          ),
        );
      
    
  }
}
