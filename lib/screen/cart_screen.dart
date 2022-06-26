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
                    OrderButton(cart: cart)
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







class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    
    return FlatButton(
        onPressed: (widget.cart.totalAmount <= 0 || _isLoading) ? null  : () async{

          setState(() {
            _isLoading = true;
          });

          await  Provider.of<Order>(context, listen: false).addOrder(widget.cart.item.values.toList(), widget.cart.totalAmount);
          setState(() {
            _isLoading = false;
          });
            widget.cart.clear();

        },
        child: _isLoading ? CircularProgressIndicator(): Text(
          "Order now!",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold),
        ));
  }
}
