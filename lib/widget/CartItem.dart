// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_string_escapes

import 'package:flutter/material.dart'; 

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  const CartItem({Key? key, required this.id, required this.price, required this.quantity, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:
          Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: ListTile(
            leading: CircleAvatar(
              radius: 27,
              child: FittedBox(child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("\৳${price}"),
              )),
            ),
            title: Text(title),
            subtitle: Text("Total: ${(price*quantity)}"),
            trailing: Text("${quantity} x", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),
          ),
          ),
    );
  }
}
