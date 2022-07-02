// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_field

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/widget/app_drawer.dart';
import '../provider/order.dart' show Order;
import 'package:friends_supper_shop/widget/orderItem.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static final routeName = "order-screen";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async{
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Order>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: AppDrawer(),
      body: _isLoading?Center(child: CircularProgressIndicator(),) :ListView.builder(
          itemCount: orderData.order.length,
          itemBuilder: (context, index) =>
              OrderItem(order: orderData.order[index])),
    );
  }
}
