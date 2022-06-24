// ignore_for_file: prefer_const_constructors, sort_child_properties_last, constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/cart.dart';
import 'package:friends_supper_shop/provider/products.dart';
import 'package:friends_supper_shop/screen/cart_screen.dart';
import 'package:friends_supper_shop/widget/app_drawer.dart';
import 'package:friends_supper_shop/widget/badge.dart';
import 'package:provider/provider.dart';
import '../widget/product_gridview.dart';

enum FilterOption { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}



class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorite = false;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit){
        setState(() {
          _isLoading=true;
        });
        Provider.of<Products>(context).fatchAndSetData().then((value) {
          setState(() {
            _isLoading = false;
          });
        });
    }
    
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(title: Text("Friends supper shop!"), actions: [
          PopupMenuButton(
              onSelected: (FilterOption value) {
                setState(() {
                  if (value == FilterOption.Favorites) {
                    _showOnlyFavorite = true;
                  } else {
                    _showOnlyFavorite = false;
                  }
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Only Favourite"),
                      value: FilterOption.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOption.All,
                    )
                  ]),
          Consumer<Cart>(
            builder: ((context, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCount.toString(),
                color: Colors.red)),
            child:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: Icon(Icons.shopping_cart)),
          )
        ]),
        drawer: AppDrawer(),
        body: _isLoading?Center(
          child: CircularProgressIndicator(),
        ): ProductsGridView(_showOnlyFavorite));
  }
}
