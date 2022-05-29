// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, dead_code, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
import '../provider/order.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
    var _expanded = false;
  @override
  Widget build(BuildContext context) {
  

    return Card(
      elevation: 3,
      shadowColor: Color(0xffe6ffee),
      color: Color(0xffe6ffee),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\৳ ${widget.order.amount}"),
            subtitle:
                Text(DateFormat('dd/MM/yyyy').format(widget.order.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.product.length * 20.0 + 70, 200),
              child: ListView(
            children: widget.order.product
                .map((prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          prod.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${prod.quantity}x \৳${prod.price}",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      ],
                    ))
                .toList(),
          ),
            ),
          
        ],
      ),
    );
  }
}
