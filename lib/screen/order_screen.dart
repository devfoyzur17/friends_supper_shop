// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/widget/app_drawer.dart'; 
import '../provider/order.dart' show Order;
import 'package:friends_supper_shop/widget/orderItem.dart'; 
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static final routeName = "order-screen";

  @override
  Widget build(BuildContext context) {

    final orderData = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Your Order"),),
      drawer: AppDrawer(),

      body: ListView.builder(
        itemCount: orderData.order.length ,
        itemBuilder:   (context, index) =>  OrderItem(order: orderData.order[index])),
    );
    
  }
}