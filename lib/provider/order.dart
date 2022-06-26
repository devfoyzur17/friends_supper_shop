// ignore_for_file: prefer_final_fields, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:friends_supper_shop/provider/cart.dart';
import 'package:http/http.dart' as http;

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

  Future<void> faceAndSetProduct() async {
    final url = Uri.https(
        "friends-supper-shop-default-rtdb.firebaseio.com", "/orders.json");
    final response = await http.get(url);
    final List<OrderItem> loadedOrder = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
 
   if(extractedData ==null){
      return;
   }

    extractedData.forEach((productId, orderData) {
      loadedOrder.add(OrderItem(
          id: productId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          product: (orderData['product'] as List<dynamic>)
              .map((item) => CartItem(
                  id: item['id'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price']))
              .toList()));
    });
    _order = loadedOrder.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    final url = Uri.https(
        "friends-supper-shop-default-rtdb.firebaseio.com", "/orders.json");
    final timeStamp = DateTime.now();

    final response = await http.post(url,
        body: json.encode({
          "amount": total,
          "dateTime": timeStamp.toIso8601String(),
          "product": cartProduct
              .map((cp) => {
                    "id": cp.id,
                    "price": cp.price,
                    "title": cp.title,
                    "quantity": cp.quantity
                  })
              .toList()
        }));

    // _order.insert(
    //     0,
    //     OrderItem(
    //         id: json.decode(response.body)["name"],
    //         amount: total,
    //         product: cartProduct,
    //         dateTime: DateTime.now()));
    // notifyListeners();
  }
}
