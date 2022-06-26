// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      this.isFavourite = false});

  void setFavValue(bool newValue) {
    isFavourite = newValue;
    notifyListeners();
  }



  Future<void> toggoleFavouriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();

    final url = Uri.https("friends-supper-shop-default-rtdb.firebaseio.com",
        "/products/$id.json");

    try {
      final response =
          await http.patch(url, body: json.encode({"isFavorite": isFavourite}));
      if (response.statusCode >= 400) {
        setFavValue(oldStatus);
      }
    } catch (error) {
      setFavValue(oldStatus);
    }
  }
}
