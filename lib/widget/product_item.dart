// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const ProductItem(
      {required this.id, required this.title, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        
          title: Text(title),
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),trailing: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),),
    );
  }
}
