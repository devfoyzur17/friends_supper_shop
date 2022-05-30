
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  const UserProductItem({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),),
      title:Text(title),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Theme.of(context).primaryColor,),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Theme.of(context).errorColor,)
        ],),
      ),

    );
    
  }
}