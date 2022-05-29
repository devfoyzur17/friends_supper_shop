// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_string_escapes, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart'; 

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  const CartItem(
      {Key? key,
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, size: 40,color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){

          Provider.of<Cart>(context, listen: false).removeItem(productId);

      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: ListTile(
            leading: CircleAvatar(
              radius: 27,
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("\৳${price}"),
              )),
            ),
            title: Text(title),
            subtitle: Text("Total: ${(price * quantity)}"),
            trailing: Text(
              "${quantity} x",
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
