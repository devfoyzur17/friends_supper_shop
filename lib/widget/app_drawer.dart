// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/screen/order_screen.dart';
import 'package:friends_supper_shop/screen/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      
        
        children: [
          
          UserAccountsDrawerHeader(
            
              accountName: Text("Foyzur Rahaman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              accountEmail: Text("foyzur17@gmail.com", style: TextStyle(color: Colors.white70),),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(100),
               child: Image.asset("assets/image/pro.jpg",fit: BoxFit.cover),
              ),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Shop"),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              Divider(), 
              ListTile(
                leading: Icon(Icons.payment),
                title: Text("Orders"),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
                },
              ),
                Divider(), 
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Manage Product"),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
                },
              )
        ],
      ),
    );
  }
}
