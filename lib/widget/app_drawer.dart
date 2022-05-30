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
               child: Image.network("https://scontent.fdac80-1.fna.fbcdn.net/v/t39.30808-6/283173410_1399735097137694_377234932240311539_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=I2RXY35m0vAAX-_u8TA&_nc_ht=scontent.fdac80-1.fna&oh=00_AT8BT7EmWmFIn88T2NNL-Nc7zQ24JNfN04OlS27aQE1Dzg&oe=6297B524"),
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
