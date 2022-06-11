
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:friends_supper_shop/screen/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const UserProductItem({Key? key,required this.id, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),),
      title:Text(title),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
          }, icon: Icon(Icons.edit), color: Theme.of(context).primaryColor,),
          IconButton(onPressed: (){
            Provider.of<Products>(context,listen: false).deleteProduct(id);
          }, icon: Icon(Icons.delete), color: Theme.of(context).errorColor,)
        ],),
      ),

    );
    
  }
}