import 'package:flutter/material.dart';
import 'package:json_list/models/product.dart';
import 'productServices.dart';
import 'package:json_list/models/order.dart';

class JsonParseProduct extends StatefulWidget {
  @override
  _JsonParseProductState createState() => _JsonParseProductState();
}

class _JsonParseProductState extends State<JsonParseProduct> {
  List<Product> _products;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();
    _isloading = true;
    productServices.getProducts().then((products) {
      setState(() {
        _products = products;
        _isloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isloading ? 'Loading ...' : "Products"),
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemBuilder: (context, index){
              Product product = _products[index];
              return ListTile(
                title: Text(product.productName),
                subtitle: Image.network(product.imageUrl),
              );
            },
          )
      ),
    );
  }
}
