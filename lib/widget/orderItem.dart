// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../provider/order.dart' as ord; 
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,

      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\৳ ${order.amount}"),
            subtitle: Text(DateFormat().add_yMMMEd().format(order.dateTime)),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),

    );
    
  }
}