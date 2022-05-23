
 // ignore_for_file: unused_local_variable
 
import 'package:flutter/material.dart'; 
import 'package:friends_supper_shop/screen/products_overview_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
 

    return MaterialApp(
       
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        
        primarySwatch:  Colors.deepOrange,
      ),
      home: const ProductOverviewScreen(),
    );
  }
  
   
}

 