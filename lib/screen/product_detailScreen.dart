// ignore_for_file: prefer_const_constructors, prefer_const_declarations, sized_box_for_whitespace

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
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(children: [

          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl,fit: BoxFit.fitHeight,),
      
          ),
          SizedBox(height: 15,),
          Text(loadedProduct.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1, wordSpacing: 1),),
            SizedBox(height: 10,),
          Text("\৳ ${loadedProduct.price}", style: TextStyle(fontSize: 17,  color: Colors.red),),
            SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(loadedProduct.description ,style: TextStyle(color: Colors.grey,fontSize: 16),softWrap: true,textAlign: TextAlign.center,))
          
        ],),
      ),
    );
  }
}