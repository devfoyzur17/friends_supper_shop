// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart'; 

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  const ProductDetailScreen({ Key? key}) : super(key: key);

  static final routeName ="product-details-screen";

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =  Provider.of<Products>(context,listen: false).findById(productId);

     
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Center(child: Image.network(loadedProduct.imageUrl),),
    );
  }
}