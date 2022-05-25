// ignore_for_file: prefer_const_constructors, sort_child_properties_last, constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers

 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widget/product_gridview.dart'; 

enum FilterOption{
  Favorites,
  All
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
      bool _showOnlyFavorite = false;

      
  @override
  Widget build(BuildContext context) {


 
    return Scaffold(
        appBar: AppBar(title: Text("Friends supper shop!"),actions: [
          PopupMenuButton(
            onSelected: (FilterOption value){

              setState(() {
                
               if(value == FilterOption.Favorites){

                 _showOnlyFavorite = true;
                  
               }else{
                 _showOnlyFavorite = false;
               
               }
              });
              
            } ,
            itemBuilder: (context)=>[
            PopupMenuItem(child: Text("Only Favourite"),value: FilterOption.Favorites,),
            PopupMenuItem(child: Text("Show All"), value: FilterOption.All,)
          ])
        ]),
        body: ProductsGridView(_showOnlyFavorite));
  }
}