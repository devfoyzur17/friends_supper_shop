// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:friends_supper_shop/provider/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.product,
      required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _order = [];

  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _order.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            product: cartProduct,
            dateTime: DateTime.now()));
            notifyListeners();
  }
}
