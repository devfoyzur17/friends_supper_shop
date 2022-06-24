// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_field, unused_element, prefer_const_constructors_in_immutables, prefer_final_fields, avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:friends_supper_shop/provider/products.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class EditProductScreen extends StatefulWidget {
  EditProductScreen({Key? key}) : super(key: key);
  static final routeName = "edit-product-screen";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: "", title: "", description: "", imageUrl: "", price: 0);
  var _isInit = true;
  var _isLoading = false;
  var _initValues = {
    "title": "",
    "description": "",
    "imageUrl": "",
    "prise": ""
  };

  @override
  void initState() {
    // TODO: implement initState

    _imageUrlFocusNode.addListener(_upgradeImageUrl);

    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_upgradeImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageController.dispose();

    super.dispose();
  }

  void _upgradeImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageController.text.startsWith("http") &&
              !_imageController.text.startsWith("https")) ||
          (!_imageController.text.endsWith(".jpg") &&
              !_imageController.text.endsWith(".png") &&
              !_imageController.text.endsWith("jpeg"))) {
        return;
      }

      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValidate = _form.currentState!.validate();
    if (!isValidate) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedProduct.id != "") {
       Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
       await showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text("An error occured!"),
                content: Text(error.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Okey"))
                ],
              );
            });
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(productId.toString());
        _initValues = {
          "title": _editedProduct.title,
          "description": _editedProduct.description,
          "imageUrl": "",
          "price": _editedProduct.price.toString()
        };
        _imageController.text = _editedProduct.imageUrl;
      }
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: _initValues["title"],
                        decoration: InputDecoration(label: Text("Tittle")),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide product tittle';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              isFavourite: _editedProduct.isFavourite,
                              id: _editedProduct.id,
                              title: value.toString(),
                              description: _editedProduct.description,
                              imageUrl: _editedProduct.imageUrl,
                              price: _editedProduct.price);
                        },
                      ),
                      TextFormField(
                        initialValue: _initValues["price"],
                        decoration: InputDecoration(label: Text("Price")),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please provide product prise";
                          }
                          if (double.tryParse(value) == null) {
                            return "Please provide product valid price";
                          }
                          if (double.parse(value) <= 0) {
                            return "Please provide a price gater than 0";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              isFavourite: _editedProduct.isFavourite,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              imageUrl: _editedProduct.imageUrl,
                              price: double.parse(value!));
                        },
                      ),
                      TextFormField(
                        initialValue: _initValues["description"],
                        decoration: InputDecoration(label: Text("Description")),
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        focusNode: _descriptionFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please provide product description";
                          }
                          if (value.length < 10) {
                            return "Shoud be at last 10 charecter";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavourite: _editedProduct.isFavourite,
                            title: _editedProduct.title,
                            description: value.toString(),
                            imageUrl: _editedProduct.imageUrl,
                            price: _editedProduct.price,
                          );
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.only(top: 10, right: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: _imageController.text.isEmpty
                                  ? Center(child: Text("Enter a Url"))
                                  : FittedBox(
                                      child: Image.network(
                                        _imageController.text,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Image Url",
                              ),
                              controller: _imageController,
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              focusNode: _imageUrlFocusNode,
                              onFieldSubmitted: (_) {
                                _saveForm();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please provide product image url";
                                }
                                if (!value.startsWith("http") &&
                                    !value.startsWith("https")) {
                                  return "Please enter a valid url";
                                }
                                if (!value.endsWith(".jpg") &&
                                    !value.endsWith(".png") &&
                                    !value.endsWith("jpeg")) {
                                  return "Please enter a valid url";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editedProduct = Product(
                                    id: _editedProduct.id,
                                    isFavourite: _editedProduct.isFavourite,
                                    title: _editedProduct.title,
                                    description: _editedProduct.description,
                                    price: _editedProduct.price,
                                    imageUrl: value.toString());
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
    );
  }
}
