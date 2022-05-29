// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/cart.dart' show Cart;
import 'package:friends_supper_shop/provider/order.dart';
import 'package:provider/provider.dart';
import '../widget/CartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Your Cart")),
        body: Column(
          children: [
            Card(
              elevation: 3,
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        "\৳ ${cart.totalAmount}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    FlatButton(
                        onPressed: () {

                            Provider.of<Order>(context, listen: false).addOrder(cart.item.values.toList(), cart.totalAmount);
                            cart.clear();

                        },
                        child: Text(
                          "Order now!",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.item.length,
                    itemBuilder: (context, index) => CartItem(
                        id: cart.item.values.toList()[index].id,
                        productId: cart.item.keys.toList()[index],
                        title: cart.item.values.toList()[index].title,
                        quantity: cart.item.values.toList()[index].quantity,
                        price: cart.item.values.toList()[index].price)))
          ],
        ));
  }
}
