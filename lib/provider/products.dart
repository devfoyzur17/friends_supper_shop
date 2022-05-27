// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:friends_supper_shop/provider/product.dart';
import 'package:provider/provider.dart';

class Products with ChangeNotifier {
  List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Lexus',
      description:
          "It is the most sold Lexus biscuit in Bangladesh.Fresh, crispy, and vegetable crackers biscuit.Amazing taste and perfect for snacks or tea time.",
      price: 75.00,
      imageUrl:
          'https://images.othoba.com/images/thumbs/0301931_danish-lexus-biscuit-240-gm.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Dano',
      description:
          "Dano Daily Pusti milk is a reasonable nutritious solution for your whole family.Produced from high-quality milk ingredients, Dano Daily Pushti contains calcium, protein, and important vitamins and minerals that are necessary for your family’s everyday wellness.",
      price: 175.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2020/11/Arla-Dano-Daily-Pusti-Milk-Box.jpg?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p3',
      title: 'Tea Bag',
      description:
          "Ispahani Mirzapore tea bag is produced by blending the most effective tea leaves of the best tea gardens in Bangladesh.It involves you in the latest packaging, designed to shield its excellent aroma and taste.",
      price: 85.50,
      imageUrl:
          'https://images.othoba.com/images/thumbs/0253891_ispahani-mirzapore-tea-bags-25-pcs.jpeg',
    ),
    Product(
      id: 'p4',
      title: 'Banana',
      description: 'Banana is very good food for oour health.',
      price: 40.00,
      imageUrl:
          'https://img.freepik.com/free-vector/vector-ripe-yellow-banana-bunch-isolated-white-background_1284-45456.jpg?t=st=1653645787~exp=1653646387~hmac=44f63dd0e3e2da2781bb5df62c2b48f6412c585c2ac4b1820d722aec326cbd92&w=740',
    ),
    Product(
      id: 'p5',
      title: 'Soyabean Oil',
      description:
          'The completely automated filling system for all SKU’s (1 Ltr, 2 Ltr, and 5 Ltr,) are from world popular Ams Ferrari, encourages to fill oil in bottles with the all-out computerization system.',
      price: 200.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2020/10/Bashundara-Soyabean-Oil-Price-in-Mirpur.jpg?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p6',
      title: 'Salt',
      description:
          '100% pure, free flow, crystal white, and perfectly iodized.Produced a completely 100% automatic machine of vacuum evaporated technology.',
      price: 35.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2020/10/ACI-Salt.jpg?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p7',
      title: 'Fresh Tissu',
      description:
          'Made in their state-of-the-art production line, Fresh Paper Napkin tissue is made utilizing the latest technologies. With central ETP and green activities, MGI is careful around zero-outflow while manufacturing a wide cluster of scented and unscented paper napkins.',
      price: 55.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2020/12/Fresh-Paper-Napkin-Tissue.jpg?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p8',
      title: 'Packet Cake',
      description:
          'Pran dry cake biscuits are amazing with tea, milk, or espresso.Delectable and crips sweet biscuit.Produced using the best quality ingredient.',
      price: 110.00,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2020/12/All-Time-Mixed-Fruit-Family-Cake.jpg?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p9',
      title: 'Clark’s Jelly',
      description:
          'Foster Clark’s jelly dessert cherry flavor makes a flavorful and nutritious refreshment.Prepare Jell-O shots or make a favorable dessert with the Foster Clarks Cherry Flavor Jelly Dessert 85g. You can relish this cherry flavor jelly whenever to fulfill your sweet desires.',
      price: 49.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2021/08/Foster-Clarks-Jelly-Dessert-Cherry-85gm.png?fit=1200%2C1200&ssl=1',
    ),
    Product(
      id: 'p10',
      title: 'Lassa Semay',
      description: 'It is very helthy for us.',
      price: 49.99,
      imageUrl:
          'https://i0.wp.com/www.khan.com.bd/wp-content/uploads/2021/04/Kishwan-Lachcha-Semai-350gm.jpg?fit=1200%2C1200&ssl=1',
    ),
  ];

  //var _showFavoriteOnly = false;

  List<Product> get item {
    // if (_showFavoriteOnly) {
    //   return _item.where((element) => element.isFavourite).toList();
    // }

    return [..._item];
  }

  List<Product> get favoriteItem {
    return _item.where((element) => element.isFavourite).toList();
  }

  Product findById(String id) {
    return _item.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    // _item.add(value);
    notifyListeners();
  }
}
